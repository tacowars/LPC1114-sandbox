/****************************************************************************
 *   $Id:: blinky_main.c 4785 2010-09-03 22:39:27Z nxp21346                        $
 *   Project: LED flashing / ISP test program
 *
 *   Description:
 *     This file contains the main routine for the blinky code sample
 *     which flashes an LED on the LPCXpresso board and also increments an
 *     LED display on the Embedded Artists base board. This project
 *     implements CRP and is useful for testing bootloaders.
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

#include "timer32.h"
#include "gpio.h"

static const uint8_t segmentlut[10] =
{
	   // FCPBAGED
		0b11011011, // 0
		0b01010000, // 1
		0b00011111, // 2
		0b01011101, // 3
		0b11010100, // 4
		0b11001101, // 5
		0b11001111, // 6
		0b01011000, // 7
		0b11011111, // 8
		0b11011101, // 9
};

void SetSegment(int n)
{
	int i;

    GPIOSetValue(1, 11, 0);

	if(n < 0)
		n = 0;
	else
		n = segmentlut[n];

    for(i=0;i<8;i++)
    {
    	if((n>>(7-i))&1)
    		GPIOSetValue(0, 9, 0);
    	else
    		GPIOSetValue(0, 9, 1);
    	GPIOSetValue(2, 11, 0);
    	GPIOSetValue(2, 11, 1);
    }
    GPIOSetValue(1, 11, 1);
}

void Init7Segment(void)
{
    // Turn off 7-segment display
	GPIOSetDir(0, 9, 1); // MOSI
	GPIOSetDir(2, 11, 1); // CLK
	GPIOSetDir(1, 11, 1); // CS
	GPIOSetValue(1, 11, 0);
    SetSegment(-1);
}

/* Main Program */

int main (void)
{
	int i = 0, on=0;
  /* Basic chip initialization is taken care of in SystemInit() called
   * from the startup code. SystemInit() and chip settings are defined
   * in the CMSIS system_<part family>.c file.
   */

  /* Initialize 32-bit timer 0. TIME_INTERVAL is defined as 10mS */
  /* You may also want to use the Cortex SysTick timer to do this */
  init_timer32(0, TIME_INTERVAL);
  /* Enable timer 0. Our interrupt handler will begin incrementing
   * the TimeTick global each time timer 0 matches and resets.
   */
  enable_timer32(0);

  /* Initialize GPIO (sets up clock) */
  GPIOInit();
  /* Set LED port pin to output */
  GPIOSetDir( LED_PORT, LED_BIT, 1 );
  Init7Segment();

  while (1)                                /* Loop forever */
  {
	/* Each time we wake up... */
	/* Check TimeTick to see whether to set or clear the LED I/O pin */
	if ( (timer32_0_counter%(LED_TOGGLE_TICKS/COUNT_MAX)) < ((LED_TOGGLE_TICKS/COUNT_MAX)/2) )
	{
	  GPIOSetValue( LED_PORT, LED_BIT, LED_OFF );
	  on=0;
	} else
	{
	  GPIOSetValue( LED_PORT, LED_BIT, LED_ON );
	  if(!on)
	  {
		  SetSegment((i%COUNT_MAX)+1);
		  i++;
	  }
	  on=1;
	}
    /* Go to sleep to save power between timer interrupts */
    __WFI();
  }
}
