/*****************************************************************************
 *   target_config.h:  config file for wdt example for NXP LPC11xx Family
 *   Microprocessors
 *
 *   Copyright(C) 2010, NXP Semiconductor
 *   All rights reserved.
 *
 *   History
 *   2010.09.07  ver 1.00    Preliminary version, first Release
 *
******************************************************************************/

/*

User #defines:
   LED_PORT	I/O port driving an LED
   LED_BIT  I/O port bit driving an LED
   LED_ON   Value to set the bit to turn on the LED
   LED_OFF  Value to set the bit to turn off the LED
   LED_TOGGLE_TICKS
		    Number of timer ticks per flash. The timer is configured to generate
		    an interrupt 100 times a second or every 10mS.
   FAST_LED_TOGGLE_TICKS
		    Number of timer ticks per flash. This value is used if a watchdog reset
		    is detected.

*/

#define LED_PORT 0		// Port for led
#define LED_BIT 7		// Bit on port for led
#define LED_ON 1		// Level to set port to turn on led
#define LED_OFF 0		// Level to set port to turn off led

#define LED_TOGGLE_TICKS 100 // 100 ticks = 1 Hz flash rate
#define FAST_LED_TOGGLE_TICKS 50 // 100 ticks = 1 Hz flash rate

/*********************************************************************************
**                            End Of File
*********************************************************************************/
