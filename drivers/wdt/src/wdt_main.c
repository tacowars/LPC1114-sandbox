/****************************************************************************
 *   $Id:: wdt_main.c 6285 2011-01-27 22:31:24Z nxp21346                    $
 *   Project: NXP LPC11xx WDT example
 *
 *   Description:
 *     This file contains WDT test modules, main entry, to test WDT APIs.
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

#include "timer16.h"
#include "gpio.h"
#include "wdt.h"

extern volatile uint32_t timer16_0_counter;
volatile uint32_t feed_counter = 0;

/*****************************************************************************
**   Main Function  main()
******************************************************************************/
int main (void)
{
  /*** The main Function is an endless loop ****/

  // Configure WDT to run from internal WD oscillator at about 8 kHz
  WDTInit();

  init_timer16( 0, TIME_INTERVALmS * 10 );
  enable_timer16( 0 );

  /* Set LED pin to output and make sure it is off */
  GPIOSetDir( LED_PORT, LED_BIT, 1 );
  GPIOSetValue( LED_PORT, LED_BIT, LED_OFF );

  // Check reset status for watchdog reset- if found, blink quickly
  if ((LPC_SYSCON->SYSRSTSTAT & 0x4) == 0x4)
  {
    LPC_SYSCON->SYSRSTSTAT |= 0x4;
    while( 1 ) 
    {
  	  /* I/O configuration and LED setting pending. */
  	  if ( (timer16_0_counter > 0) && (timer16_0_counter <= FAST_LED_TOGGLE_TICKS/2) )
  	  {
  	    GPIOSetValue( LED_PORT, LED_BIT, LED_OFF );
  	  }
  	  if ( (timer16_0_counter > FAST_LED_TOGGLE_TICKS/2) 
			&& (timer16_0_counter <= FAST_LED_TOGGLE_TICKS) )
  	  {
  	    GPIOSetValue( LED_PORT, LED_BIT, LED_ON );
  	  }
  	  else if ( timer16_0_counter > FAST_LED_TOGGLE_TICKS )
  	{
  	    timer16_0_counter = 0;
  	  }
  	}
  }
  else
  { // No watchdog reset- lets blink slowly
  while( 1 )
  {
	  /* I/O configuration and LED setting pending. */
	  if ( (timer16_0_counter > 0) && (timer16_0_counter <= LED_TOGGLE_TICKS/2) )
	  {
	    GPIOSetValue( LED_PORT, LED_BIT, LED_OFF );
	  }
	  if ( (timer16_0_counter > LED_TOGGLE_TICKS/2) && (timer16_0_counter <= LED_TOGGLE_TICKS) )
	  {
	    GPIOSetValue( LED_PORT, LED_BIT, LED_ON );
	  }
	  else if ( timer16_0_counter > LED_TOGGLE_TICKS )
	  {
	    timer16_0_counter = 0;
	  }
    }
  }
}

/*********************************************************************************
**                            End Of File
*********************************************************************************/
