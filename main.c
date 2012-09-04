/*
===============================================================================
 Name      Hello ARM  : main.c
===============================================================================
*/
#include "driver_config.h"
#include "target_config.h"

#include <stdlib.h>
#include <stdio.h>
#include <uart.h>
#ifdef __USE_CMSIS
#include "LPC11xx.h"
#include "system_LPC11xx.h"
#endif

#include <cr_section_macros.h>
#include <NXP/crp.h>

// Variable to store CRP value in.
__CRP const unsigned int CRP_WORD = CRP_NO_CRP ;

// SysTick Timer
volatile unsigned long SysTickCnt=0;      /* SysTick Counter                    */
volatile unsigned long IRQTickCnt=0;      /* fast counter                    */
volatile unsigned long ClockTickCnt=0;      /* beat counter                    */

// UART
extern volatile uint32_t UARTCount;
extern volatile uint8_t UARTBuffer[BUFSIZE];

// TImer OSC
volatile unsigned int Frequency = 65535; // lower is higher

void SysTick_Handler (void) {           /* SysTick Interrupt Handler (~1ms)    */
	SysTickCnt++;
	if (IRQTickCnt >= 100) {
		LPC_GPIO0->DATA ^= (1<<7); /* toggle GPIOX_X */
		IRQTickCnt = 0;
	}
	IRQTickCnt++;
	uint16_t decr = 392;


	if (LPC_TMR16B0->MR0 >= decr ) {LPC_TMR16B0->MR0 -= decr;} else { LPC_TMR16B0->MR0 = 0;}
	if (LPC_TMR16B0->MR1 >= decr ) {LPC_TMR16B0->MR1 -= decr;} else { LPC_TMR16B0->MR1 = 0;}
	if (LPC_TMR16B0->MR2 >= decr ) {LPC_TMR16B0->MR2 -= decr;} else { LPC_TMR16B0->MR2 = 0;}
}

void Delay (unsigned long tick) {       /* Delay Function                     */
  unsigned long systick;
  //unsigned long tick_cnt = tick;
  systick = SysTickCnt;				//systickcnt has the start-up time
  while ((SysTickCnt - systick) < tick);
}

void LEDinit(void) {

	// Pin 28 - PORT0 PIN7
	LPC_GPIO0->DIR |= (1<<7); /* GPIOX_X as output */
	LPC_GPIO0->DATA |= (1<<7); /* set GPIOX_X */

	// Pin 26 - PORT0 PIN3
	LPC_GPIO0->DIR |= (1<<3); /* GPIOX_X as output */
	LPC_GPIO0->DATA |= (1<<3); /* set GPIOX_X */
	// Examples
	//LPC_GPIO0->OUT ^= (1<<3); /* toggle GPIOX_X */
	//LPC_GPIO0->OUT &= ~(1<<3); /* clear GPIOX_X */
}

void TMR16init() {
	// System AHB clock control register - Enable Timer16B0 Table 21, P30 in user manual
	LPC_SYSCON->SYSAHBCLKCTRL |= (1 << 7);
	/* IOCON_PIO0_8 register - Enable CT16B0_MAT0 pin p85*/
	LPC_IOCON->PIO0_8 |= (1<<1); // enabling bit 1 sets match pin
	/* IOCON_PIO0_8 register - Enable CT16B0_MAT0 pin p85*/
	LPC_IOCON->PIO0_9 |= (1<<1); // enabling bit 1 sets match pin
	/* IOCON_PIO0_8 register - Enable CT16B0_MAT1 pin p85*/
	LPC_IOCON->SWCLK_PIO0_10 |= (6>>1); // enabling bit 1 sets match pin

	/* Enable PWM function on all CT16B0_MATx pins */
	LPC_TMR16B0->PWMC |= 0b111; // 65535 16bit TOP 1800hz?

	/* Set the PWM frequency */
	LPC_TMR16B0->MR3 = Frequency; // p.327 in UM
	/* Set initial duty cycle */
	LPC_TMR16B0->MR0 = Frequency / 10; // p.327 in UM
	LPC_TMR16B0->MR1 = Frequency / 10;
	LPC_TMR16B0->MR2 = Frequency / 10;
	/* TMR16B0MCR - Reset on MR3 p.330 in UM */
	LPC_TMR16B0->MCR |= (1<<10); // Reset on MR3: the TC will be reset if MR3 matches it.
	LPC_TMR16B0->PR = 10; // The 16-bit Prescale Register specifies the maximum value for the Prescale Counter.
	LPC_TMR16B0->PC = 2; // Prescale Counter register
	/* Count Control Register (TMR16B0TCR - Start Timer16B0 p.329 in UM */
	LPC_TMR16B0->TCR = 1;// |= (1<<1);
}

void playNote(uint8_t note) {
	Frequency = 65000 - (note * 2500);

	/* Set the PWM frequency */
	LPC_TMR16B0->MR3 = Frequency; // p.327 in UM
	/* Set initial duty cycle */
	LPC_TMR16B0->MR0 = Frequency / 2; // p.327 in UM
}

void beatLight() {
	if (ClockTickCnt == 0) {
	LPC_TMR16B0->MR0 = 65000; // (65000 / 1000) = 65
	LPC_TMR16B0->MR1 = 65000;
	LPC_TMR16B0->MR2 = 65000;
	}
	ClockTickCnt++;
	if (ClockTickCnt == 24) {LPC_TMR16B0->MR0 = 65000;}
	if (ClockTickCnt == 48) {LPC_TMR16B0->MR1 = 65000;}
	if (ClockTickCnt == 72) {LPC_TMR16B0->MR2 = 65000;}
	if (ClockTickCnt == 96) {ClockTickCnt = 0;}

}

void beatLightOff() {
	LPC_TMR16B0->MR0 = 0; // (65000 / 1000) = 65
	LPC_TMR16B0->MR1 = 0;
	LPC_TMR16B0->MR2 = 0;
}


int main(void) {

	SystemInit();
	SysTick_Config(SystemCoreClock/1000 - 1); // sets up our delay timer
	LEDinit();
	TMR16init();
	UARTInit(UART_BAUD);

	while(1) {
		//Delay(1000);

		if (UARTCount > 0) { // MIDI commands are 3 bytes
			while (UARTCount > 0) {
				LPC_UART->IER = IER_THRE | IER_RLS;			/* Disable UART Interrupt Enable Register */
				switch ( *UARTBuffer ) {
				case 0x90: // NOTE ON, CH0
					if (UARTCount >= 3) { // wait for entire command
						*UARTBuffer = *(UARTBuffer+1); // skip the first byte
						UARTSend( (uint8_t *)UARTBuffer, 1 ); // send only note pitch
						playNote(*UARTBuffer);
						*UARTBuffer = *(UARTBuffer+1);
						UARTCount-=3;
					}
				  break;
				case 0xfa:
					LPC_GPIO0->DATA ^= (1<<3); /* toggle GPIOX_X */
					UARTSend( (uint8_t *)UARTBuffer, 1 );
					UARTCount--;
				  break;
				case 0xf8:
					beatLight();
					LPC_GPIO0->DATA ^= (1<<3); /* toggle GPIOX_X */
					UARTSend( (uint8_t *)UARTBuffer, 1 );
					UARTCount--;
				  break;
				case 0xfc:
					LPC_GPIO0->DATA &= ~(1<<3); /* clear GPIOX_X */
					beatLightOff();
					UARTSend( (uint8_t *)UARTBuffer, 1 );
					UARTCount--;
				  break;
				default:
					UARTSend( (uint8_t *)UARTBuffer, 1 );
					UARTCount--;
				  break;
				}
				LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	/* Re-enable UART Interrupt Enable Register */
			}
		}
	}
	return 0 ;
}
