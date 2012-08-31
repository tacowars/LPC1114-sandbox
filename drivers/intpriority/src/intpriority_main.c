/*****************************************************************************
 *   blinky.c:  LED blinky C file for NXP LPC11xx Family Microprocessors
 *
 *   Copyright(C) 2008, NXP Semiconductor
 *   All rights reserved.
 *
 *   History
 *   2009.12.07  ver 1.00    Preliminary version, first Release
 *
******************************************************************************/

#include "driver_config.h"
#include "target_config.h"

#include <debug_printf.h>

typedef struct
{
	int VectorNumber;
	int IntClocks;
	int Pending;
} InterruptRecord;

volatile int IRIdx;
InterruptRecord IR[30];
int priLUT[32];

void WAKEUP1_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 1; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<1; }
void WAKEUP2_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 2; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<2; }
void WAKEUP3_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 3; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<3; }

void WAKEUP6_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 6; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<6; }
void WAKEUP7_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 7; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<7; }
void WAKEUP8_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 8; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<8; }
void WAKEUP9_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 9; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<9; }

void WAKEUP11_IRQHandler() { volatile InterruptRecord *pIR = &IR[IRIdx++]; pIR->VectorNumber = 11; pIR->IntClocks = SysTick->VAL; pIR->Pending = LPC_SYSCON->STARTSRP0; LPC_SYSCON->STARTRSRP0CLR = 1<<11; }

/* Main Program */

int main (void) {
	int i;
  /* Basic chip initialization is taken care of in SystemInit() called
   * from the startup code. SystemInit() and chip settings are defined
   * in the CMSIS system_<part family>.c file.
   */

	SysTick->LOAD  = (SystemCoreClock/100) -1;
	SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
	SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
	                   SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */

	while(1)
	{
		__disable_irq();
		LPC_IOCON->R_PIO0_11 &= ~0x3E;
		LPC_IOCON->R_PIO0_11 |=  0x81;
		LPC_GPIO0->DIR  = 0xBCE;			// PIO0_0 - PIO0_11 as output (exclude reset, I2C, swdclk)
		LPC_GPIO0->MASKED_ACCESS[0xBCE] = ~0; // Drive the pins high
		LPC_SYSCON->STARTAPRP0 = 0;  		// falling edge
		LPC_SYSCON->STARTRSRP0CLR = LPC_SYSCON->STARTRSRP0CLR;	// Clear all interrupts
		LPC_SYSCON->STARTERP0 = 0xBCE; 		// enable interrupts

		for(i=0;i<8;i++)
		{
			int irq;

			// The logic below converts our ordinal index 0-7 to an interrupt vector number.
			// For simplicity we skip vector 0 which is on PIO0_0 the reset pin, vectors 4,5
			// which are I2C pins and need pullups, and vector 10 which is PIO0_10 the SWDCLK pin.
			irq = i + 1;
			if(irq >= 4) irq += 2;
			if(irq == 10) irq++;
			NVIC_EnableIRQ(irq);

			// Create priority levels for different interrupts. For the Cortex-M0,
			// there are priorities 0-3. On the Cortex-M3 parts like the LPC1343,
			// priorities can be from 0-7.
			priLUT[irq] = i%4;

			NVIC_SetPriority(irq, priLUT[irq]);
		}
		LPC_GPIO0->MASKED_ACCESS[0xBCE] = 0; // Drive pins low

		// Zero the data structure
		for(i=0;i<30;i++)
		{
			IR[i].VectorNumber = IR[i].IntClocks = 0;
		}
		IRIdx = 0;

		LPC_GPIO0->MASKED_ACCESS[0xBCE] = ~0; // Drive the pins high again
		__enable_irq();

		// Wait 1 second
		for(i=0;i<100;i++)
			while(! (SysTick->CTRL&SysTick_CTRL_COUNTFLAG_Msk));

		// Now print out the interrupt results
		debug_printf(" N: Vec Pri Pending Cycles\n");
		for(i=0;i<IRIdx;i++)
		{
			debug_printf("%2d: %3d %3d %7x %d\n", i, IR[i].VectorNumber, priLUT[IR[i].VectorNumber], IR[i].Pending, IR[0].IntClocks - IR[i].IntClocks);
		}

		// Wait 5 seconds
		for(i=0;i<500;i++)
			while(! (SysTick->CTRL&SysTick_CTRL_COUNTFLAG_Msk));
	}
}
