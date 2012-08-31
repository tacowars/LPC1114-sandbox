/****************************************************************************
 *   $Id:: systick_main.c 5141 2010-10-07 19:31:47Z nxp21346                $
 *   Project: NXP LPC11xx Systick example
 *
 *   Description:
 *     This file contains System tick test modules, main entry, to test 
 *     systick APIs.
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
#include "driver_config.h"
#include "target_config.h"

#include "small_gpio.h"

volatile uint32_t TimeTick = 0;

/* SysTick interrupt happens every 10 ms */
void SysTick_Handler(void)
{
  TimeTick++;
}

void delaySysTick(uint32_t tick)
{
  uint32_t timetick;

  timetick = TimeTick;
  while ((TimeTick - timetick) < tick)
	  __WFI();
}

/* Main Program */

int main (void) {
	  /* Basic chip initialization is taken care of in SystemInit() called
	   * from the startup code. SystemInit() and chip settings are defined
	   * in the CMSIS system_<part family>.c file.
	   */

  /* Called for system library in core_cmx.h(x=0 or 3). */
  SysTick_Config( SysTick->CALIB + 1 );

  /* Set port 0_7 - LED2 on LPCXpresso board to output */
  SetGPIOOut( LED_PORT, LED_BIT );

  while (1)                                /* Loop forever */
  {
	delaySysTick(LED_TOGGLE_TICKS/2);
	ToggleGPIOBit( LED_PORT, LED_BIT );
  }
}
