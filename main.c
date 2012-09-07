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
volatile unsigned long ClockTickCnt=0;      /* beat counter                     */
volatile unsigned long PWMTickCnt=0;      /* LED PWM counter                    */
volatile unsigned long Timer16B0TickCnt=0;      /* LED PWM counter              */
volatile uint16_t LED0 = 0;
volatile uint16_t LED1 = 0;
volatile uint16_t LED2 = 0;

static uint16_t LEDcurve [] = {
		65535, 46340, 32767, 23170, 16383, 11585, 8192, 5792, 4096, 2896, 2047, 1448, 1024, 724, 512,
		362, 256, 181, 127, 90, 64, 45, 32, 23, 16, 11, 8, 6, 4, 3, 2, 1, 1, 0
};

static uint16_t LEDcurveBIG [] = { // 50
65535, 55937, 46340, 32767, 27968, 23170, 16383, 13984, 11585, 8192, 6992, 5792, 4096, 3496, 2896, 2047,
1747, 1448, 1024, 874, 724, 512, 437, 362, 256, 218, 181, 127, 108, 90, 64, 54, 45, 32, 27, 23, 16, 13,
11, 8, 7, 6, 4, 3, 3, 2, 1, 1, 1, 0
};

static uint16_t LEDsquare [] = {
		65535, 46340, 32767, 23170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

// UART
extern volatile uint32_t UARTCount;
extern volatile uint8_t UARTBuffer[BUFSIZE];

void SysTick_Handler (void) {           /* SysTick Interrupt Handler (~1ms)    */
	SysTickCnt++;
	PWMTickCnt++;
	if (PWMTickCnt >= 6 ) {
		LPC_TMR16B0->MR0 = LEDcurveBIG[LED0];
		LPC_TMR16B0->MR1 = LEDcurveBIG[LED1];
		LPC_TMR16B0->MR2 = LEDcurveBIG[LED2];

		if (LED0 < 49) {LED0++;}
		if (LED1 < 49) {LED1++;}
		if (LED2 < 49) {LED2++;}
		PWMTickCnt = 0;
	}
}

//void TIMER16_0_IRQHandler(void) {
//
//	if (LPC_TMR16B0->IR == (1<<3)) {
//		// Do stuff here
//		LPC_TMR16B0->IR = (1<<3); // clear interrupt flag
//
//	}
//	return;
//}

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
	//LPC_GPIO0->DATA ^= (1<<3); /* toggle GPIOX_X */
	//LPC_GPIO0->DATA &= ~(1<<3); /* clear GPIOX_X */
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
	unsigned int Frequency = 0xFFFF;
	LPC_TMR16B0->MR3 = Frequency; // p.327 in UM
	/* Set initial duty cycle */
	LPC_TMR16B0->MR0 = Frequency / 2; // p.327 in UM
	LPC_TMR16B0->MR1 = Frequency / 2;
	LPC_TMR16B0->MR2 = Frequency / 2;
	/* TMR16B0MCR - Reset on MR3 p.330 in UM */
	LPC_TMR16B0->MCR |= (1<<9) | (1<<10); // #9 is Interrupt. #10 is Reset on MR3: the TC will be reset if MR3 matches it.

	LPC_TMR16B0->PR = 1; // 6 The 16-bit Prescale Register specifies the maximum value for the Prescale Counter.
	LPC_TMR16B0->PC = 2; // 2 Prescale Counter register

    /* Enable the TIMER0 Interrupt */
    //NVIC_EnableIRQ(TIMER_16_0_IRQn);

	/* Count Control Register (TMR16B0TCR - Start Timer16B0 p.329 in UM */
	LPC_TMR16B0->TCR = 1;// |= (1<<1);
}

void beatLight() {
	LPC_UART->IER = IER_THRE | IER_RLS;			/* Disable UART Interrupt Enable Register */

	if (ClockTickCnt == 0) {
	LED0 = 0;
	LED1 = 0;
	LED2 = 0;
	}
	ClockTickCnt++;
	if (ClockTickCnt == 24) {LED0 = 0;}//LPC_TMR16B0->MR0 = 0xFFFF;}
	if (ClockTickCnt == 48) {LED1 = 0;}//{LPC_TMR16B0->MR1 = 0xFFFF;}
	if (ClockTickCnt == 72) {LED2 = 0;}//{LPC_TMR16B0->MR2 = 0xFFFF;}
	if (ClockTickCnt == 96) {ClockTickCnt = 0;}
	LPC_UART->IER = IER_THRE | IER_RLS | IER_RBR;	/* Re-enable UART Interrupt Enable Register */
}

void songStart() {
	ClockTickCnt = 0; // reset clock start
}

void songStop() {
	ClockTickCnt = 0; // reset clock start
}

int main(void) {

	SystemInit();
	SysTick_Config(SystemCoreClock/1000 - 1); // sets up our delay timer
	LEDinit();
	TMR16init();
	UARTInit(UART_BAUD);
	while(1) {
		//Delay(1000);

		while (UARTCount > 0) {
			LPC_UART->IER = IER_THRE | IER_RLS;			/* Disable UART Interrupt Enable Register */
			switch ( *UARTBuffer ) {
	//				case 0x90: // NOTE ON, CH0
	//					if (UARTCount >= 3) { // wait for entire command
	//						*UARTBuffer = *(UARTBuffer+1); // skip the first byte
	//						UARTSend( (uint8_t *)UARTBuffer, 1 ); // send only note pitch
	//						playNote(*UARTBuffer);
	//						*UARTBuffer = *(UARTBuffer+1);
	//						UARTCount-=3;
	//					}
	//				  break;
			case 0xfa:
				LPC_GPIO0->DATA ^= (1<<3); /* toggle GPIOX_X */
				UARTSend( (uint8_t *)UARTBuffer, 1 );
				songStart();
				UARTCount--;
			  break;
			case 0xf8:
				beatLight();
				//LPC_GPIO0->DATA ^= (1<<3); /* toggle GPIOX_X */
				//UARTSend( (uint8_t *)UARTBuffer, 1 );
				*UARTBuffer = *(UARTBuffer+1);
				UARTCount--;
			  break;
			case 0xfc:
				LPC_GPIO0->DATA &= ~(1<<3); /* clear GPIOX_X */
				songStop();
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
	return 0;
}
