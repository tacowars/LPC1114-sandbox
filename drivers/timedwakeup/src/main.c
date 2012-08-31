/****************************************************************************
 *   $Id:: invokeisp_main.c 4816 2010-09-07 17:24:10Z nxp21346                        $
 *   Project: NXP LPC11xx timedwakeup example
 *
 *   Description:
 *     Code sample demonstrating entry into sleep and deep sleep
 *     power save modes.
 *
 ****************************************************************************
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
****************************************************************************/

//#undef DEBUG
//#define ENABLE_CLKOUT

// Uncomment below to flash an LED. The LED consumes current.
#define FLASH_LED

#define LPCXPRESSO_LPC1343_BOARD

#include "driver_config.h"
#include "target_config.h"

#include "timer16.h"

#include "wakeupdefs.h"

// Configuration for normal operation
// If other peripherals are used, they need to be added to the _RUN macro
#define BF_PDRUNCFG_RUN    (BF_PDCFG_RESERVEDMSK   \
                            & ~(  BF_PDCFG_IRC     \
                                | BF_PDCFG_FLASH   \
                                | BF_PDCFG_WDTOSC))

// If other peripherals are used, they need to be added to the _RUN macro
#define BF_SYSAHBCLKCTRL_RUN       (BF_SYSAHBCLKCTRL_SLEEP  \
                                  | BF_SYSAHBCLKCTRL_GPIO   \
								  | BF_SYSAHBCLKCTRL_FLASHREG \
                                  | BF_SYSAHBCLKCTRL_ROM    \
                                  | BF_SYSAHBCLKCTRL_IOCON)

#define MainClockFrequency 12000000
#define WDTClockFrequency 9000 /* estimate used during debug mode */

// Approximate go to sleep+wake time in # of clock cycles
#define WUTIME_CLOCKS           60

// When changing any of the values below, check that none of the
// 16-bit timer code overflows
#define PROCDURATION_MS			50
#define  LEDDURATION_MS         50
#define WAKEDURATION_MS			(PROCDURATION_MS + LEDDURATION_MS)
#define SLEEPDURATION_MS        200
#define WDOMEASUREDURATION_MS   WAKEDURATION_MS

int main(void)
{
    LPC_SYSCON->PDRUNCFG      = BF_PDRUNCFG_RUN; // Initialize power to chip modules
    LPC_SYSCON->SYSAHBCLKCTRL = BF_SYSAHBCLKCTRL_RUN; // Initialize clocks

    InitGPIOForSleep(); // Set all GPIO as outputs driving low

    InitDeepSleep();

    while(1)
    {
        Wait1mS(PROCDURATION_MS); // Active mode: Do some work
#ifdef FLASH_LED
        SetBitsPort0(1<<7);  // Turn on LED on LPCXpresso board
#else
        SetBitsPort0(1<<6);
#endif

        Wait1mS(LEDDURATION_MS); // Active mode: Do some work
        // Current consumption is about the same (20% or so) no
        // matter what code is running. Sleep mode can be entered
        // in idle times to lower it dramatically.

#ifdef FLASH_LED
        ClrBitsPort0(1<<7);  // Turn off LED on LPCXpresso board
#else
        ClrBitsPort0(1<<6);
#endif

        EnterDeepSleep();
    }

    while(1);
}

void EnterDeepSleep(void)
{
    LPC_TMR16B0->EMR = BF_TIMER_EMR_SETOUT0; // set timer to drive P0_8 high at match

#ifndef DEBUG
    // Shut down clocks to almost everything
    LPC_SYSCON->SYSAHBCLKCTRL = BF_SYSAHBCLKCTRL_SLEEP;

    SCB->SCR |= BF_SCR_SLEEPDEEP; // Set SLEEPDEEP bit so MCU will enter DeepSleep mode on __WFI();

    // Switch main clock to low-speed WDO
    LPC_SYSCON->MAINCLKSEL = MAINCLKSEL_SEL_WDOSC;
    LPC_SYSCON->MAINCLKUEN = 0;
    LPC_SYSCON->MAINCLKUEN = 1; // toggle to enable
    LPC_SYSCON->MAINCLKUEN = 0;
#else
    // In debug mode, we are only going to sleep mode, not deep sleep
    // We must disable the SysTick interrupt because it will wake us from
    // Sleep mode
    SysTick->CTRL = 0; // enable counter, interrupts, select processor clock
#endif

    // Preload clock selection for quick switch back to IRC on wakeup
    LPC_SYSCON->MAINCLKSEL = MAINCLKSEL_SEL_IRCOSC;

    LPC_TMR16B0->TCR = BF_TIMER_TCR_RUN; // start sleep timer

    __WFI();                            // Enter deep sleep mode (sleep mode in DEBUG)
}

void WAKEUP_IRQHandler(void)
{
    LPC_SYSCON->MAINCLKUEN = 1;         // Restore main clock to IRC 12 MHz

    LPC_TMR16B0->EMR = 0;					// Clear match bit on timer

    LPC_SYSCON->STARTRSRP0CLR       =   BF_STARTLOGIC_P0_8; // Clear pending bit on start logic

    SCB->SCR &= ~BF_SCR_SLEEPDEEP; // Clear SLEEPDEEP bit so MCU will enter Sleep mode on __WFI();


    // Restore clocks to chip modules
    LPC_SYSCON->SYSAHBCLKCTRL = BF_SYSAHBCLKCTRL_RUN;

#ifdef DEBUG
    // We disable systick to sleep, must re-enable it (in debug mode only)
    SysTick->CTRL = 7; // enable counter, interrupts, select processor clock
#endif
}

void SysTick_Handler(void)
{
}

void Wait1mS(uint32_t i)
{
    SysTick->VAL = 0; // clear counter

    while(i)
    {
        // Wait for systick counter to count down and reset
        while(!(SysTick->CTRL & BF_SYSTICK_COUNTFLAG))
        	__WFI();

        i--;
    }
}

void InitDeepSleep(void)
{
#ifdef ENABLE_CLKOUT
    /* Output the Clk onto the CLKOUT Pin PIO0_1 to monitor the freq on a scope */
    LPC_IOCON->PIO0_1       = 0xC1;
    /* Select the MAIN clock as the clock out selection since it's driving the core */
    LPC_SYSCON->CLKOUTCLKSEL = 3;
    LPC_SYSCON->CLKOUTDIV = 10;
    LPC_SYSCON->CLKOUTUEN = 0;
    LPC_SYSCON->CLKOUTUEN = 1;

#endif /* ENABLE_CLKOUT */

    // Set up Systick timer for 1 mS timeouts
    // Used for general timing when awake and to calibrate the WDT
    SysTick->LOAD = (MainClockFrequency / 1000)-1;
    SysTick->VAL = 0; // reload counter
    SysTick->CTRL = 7; // enable counter, interrupts, select processor clock

    LPC_SYSCON->PDAWAKECFG =       // Configure PDAWAKECFG to restore PDRUNCFG on wake up
            LPC_SYSCON->PDRUNCFG;

    LPC_SYSCON->PDSLEEPCFG = BF_PDSLEEPCFG_WDT; // Configure deep sleep with WDT oscillator

    LPC_TMR16B0->TCR = BF_TIMER_TCR_RESET; // reset timer

    // The following lines initializing PR and MR0 are at risk for overflow
    // if the timing and frequency parameters are changed because they are
    // using a 16-bit timer.
#ifndef DEBUG
    LPC_TMR16B0->PR = 0;
    LPC_TMR16B0->MR0 = (SLEEPDURATION_MS*MeasureWDO()/WDOMEASUREDURATION_MS - WUTIME_CLOCKS - 1);
#else
    LPC_TMR16B0->PR = (MainClockFrequency / WDTClockFrequency) -1;
    LPC_TMR16B0->MR0 = SLEEPDURATION_MS*WDTClockFrequency/1000;
#endif

    LPC_TMR16B0->MCR = BF_TIMER_MCR_MATCHSTOP0 | BF_TIMER_MCR_MATCHRESET0;

    LPC_IOCON->PIO0_8 = (LPC_IOCON->PIO0_8 & ~0x3F) | 0x2; // Set IOCON register on P0.8 to match function

    /* Configure Wakeup I/O */
    /* Specify the start logic to allow the chip to be waken up using PIO0_8 */
    LPC_SYSCON->STARTAPRP0          |=  BF_STARTLOGIC_P0_8; // Rising edge
    LPC_SYSCON->STARTRSRP0CLR       =   BF_STARTLOGIC_P0_8; // Clear pending bit
    LPC_SYSCON->STARTERP0           |=  BF_STARTLOGIC_P0_8; // Enable Start Logic
    NVIC_EnableIRQ(WAKEUP8_IRQn);
}

uint32_t MeasureWDO(void)
{
    uint32_t start,end;
    static uint32_t WDO_clocks;

    if(!WDO_clocks)
    {
        // Configure Watchdog Oscillator
        LPC_SYSCON->WDTOSCCTRL = (0x1<<5) | (0x1F<<0);

        LPC_SYSCON->SYSAHBCLKCTRL |= BF_SYSAHBCLKCTRL_WDT;  // Turn on clock to WDT register block

        // Now enable clock to WDT counter
#if defined(DEBUG)
        LPC_SYSCON->WDTCLKSEL = WDTCLKSEL_SEL_MAINCLK;
#else
        LPC_SYSCON->WDTCLKSEL = WDTCLKSEL_SEL_WDOSC;
#endif
        LPC_SYSCON->WDTCLKUEN = 0;  // Arm WDT clock selection update
        LPC_SYSCON->WDTCLKUEN = 1;  // Update WDT clock selection
        LPC_SYSCON->WDTCLKUEN = 0;  // Arm WDT clock selection update
        LPC_SYSCON->WDTCLKDIV = 1;  // WDT clock divide by 1

        LPC_WDT->TC = 0xFFFFFF;   // big value, WDT timer duration = don't care
        LPC_WDT->MOD = 1;           // enable WDT for counting/interrupts but not resets
        LPC_WDT->FEED = 0xAA;       // WDT start sequence step 1
        LPC_WDT->FEED = 0x55;       // WDT start sequence step 2

        Wait1mS(100);               // Need to delay before measuring because WDT looses 256 cycles
        start = LPC_WDT->TV;
        Wait1mS(WDOMEASUREDURATION_MS);
        end = LPC_WDT->TV;

        LPC_SYSCON->SYSAHBCLKCTRL &= ~BF_SYSAHBCLKCTRL_WDT;  // Turn off clock to WDT register block
        WDO_clocks = (start-end)*4;
    }

    return WDO_clocks;
}

void InitGPIOForSleep(void)
{
    // Set pins to output and drive low
    // changes need to be made here depending on PCB layout to
    // minimize power consumption
#ifdef DEBUG
    LPC_GPIO0->DIR  = 0xFFE; // Set all GPIO pins as outputs except reset
#else
    LPC_GPIO0->DIR  = 0xFFF; // Set all GPIO pins as outputs
#endif
    LPC_GPIO1->DIR  = 0xFFF; // Set all GPIO pins as outputs
    LPC_GPIO2->DIR  = 0xFFF; // Set all GPIO pins as outputs
    LPC_GPIO3->DIR  = 0xFFF; // Set all GPIO pins as outputs

#ifdef LPCXPRESSO_LPC1343_BOARD
    LPC_GPIO0->DATA = 1;     // Set all GPIO pins low except JTAG reset
#else
    LPC_GPIO0->DATA = 0;     // Set all GPIO pins low
#endif
    LPC_GPIO1->DATA = 0;     // Set all GPIO pins low
#ifdef KEIL_MCB1000_BOARD
    LPC_GPIO2->DATA = 0xFF;  // All pins low except LEDs
#else
    LPC_GPIO2->DATA = 0;     // Set all GPIO pins low
#endif
    LPC_GPIO3->DATA = 0;     // Set all GPIO pins low

    // Configure pins as GPIO without pullup
    LPC_IOCON->PIO2_6 = 0xC0;
    LPC_IOCON->PIO2_0 = 0xC0;
    LPC_IOCON->PIO0_1 = 0xC0;
    LPC_IOCON->PIO1_8 = 0xC0;
    LPC_IOCON->PIO0_2 = 0xC0;
    LPC_IOCON->PIO2_7 = 0xC0;
    LPC_IOCON->PIO2_8 = 0xC0;
    LPC_IOCON->PIO2_1 = 0xC0;
    LPC_IOCON->PIO0_3 = 0xC0;
    LPC_IOCON->PIO0_4 = 0xC0; // I2C pin
    LPC_IOCON->PIO0_5 = 0xC0; // I2C pin
    LPC_IOCON->PIO1_9 = 0xC0;
    LPC_IOCON->PIO3_4 = 0xC0;
    LPC_IOCON->PIO2_4 = 0xC0;
    LPC_IOCON->PIO2_5 = 0xC0;
    LPC_IOCON->PIO3_5 = 0xC0;
    LPC_IOCON->PIO0_6 = 0xC0;
    LPC_IOCON->PIO0_7 = 0xC0;
    LPC_IOCON->PIO2_9 = 0xC0;
    LPC_IOCON->PIO2_10 =0xC0;
    LPC_IOCON->PIO2_2 = 0xC0;
    LPC_IOCON->PIO0_8 = 0xC0;
    LPC_IOCON->PIO0_9 = 0xC0;

    LPC_IOCON->PIO1_10 = 0xC0; // ADC pin
    LPC_IOCON->PIO2_11 = 0xC0;

    LPC_IOCON->PIO3_0 = 0xC0;
    LPC_IOCON->PIO3_1 = 0xC0;
    LPC_IOCON->PIO2_3 = 0xC0;

    LPC_IOCON->PIO1_4 = 0xC0; // ADC pin
    LPC_IOCON->PIO1_11 = 0xC0; // ADC pin
    LPC_IOCON->PIO3_2 = 0xC0;
    LPC_IOCON->PIO1_5 = 0xC0;
    LPC_IOCON->PIO1_6 = 0xC0;
    LPC_IOCON->PIO1_7 = 0xC0;
    LPC_IOCON->PIO3_3 = 0xC0;

    LPC_IOCON->R_PIO0_11 = 0xC1; // ADC pin
    LPC_IOCON->R_PIO1_0  = 0xC1; // ADC pin
    LPC_IOCON->R_PIO1_1  = 0xC1; // ADC pin
    LPC_IOCON->R_PIO1_2 = 0xC1; // ADC pin
#ifndef DEBUG
    LPC_IOCON->RESET_PIO0_0     = 0xC1; // disables reset
    LPC_IOCON->SWCLK_PIO0_10 = 0xC1; // disables SWCLK
    LPC_IOCON->SWDIO_PIO1_3 = 0xC1; // ADC pin, disables SWDIO
#endif
}

