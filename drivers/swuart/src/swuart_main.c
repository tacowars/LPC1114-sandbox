/***********************************************************************
 * $Id:: swuart_main.c 4785 2010-09-03 22:39:27Z nxp21346              $
 *
 * Project: LPC11XX/LPC13XX Software UART
 *
 * Description:
 *   This software acts as a standard UART with 1 start, 8 data and 1
 *   stop bit (no parity) setup. TIMER32_0 MAT0.3 on P0.11 (pin 32
 *   on LQFP48 package) generates UART output while TIMER32_0
 *   CAP0.0 on P1.5 (pin 45 on LQFP48 package) receives serial data.
 *
 *   While P3.0 is low, a routine that calculates future transmission
 *   parameters is active. P3.1 is low while TIMER32_0 interrupt service
 *   routine (ISR) is running. P3.2 is low while software UART
 *   transmission portion of the TIMER32_0 ISR is executed. P3.3 indicates
 *   when the software UART receiving related TIMER32_0 ISR is active.
 *   P1.11 activity matches write access to the tx FIFO.
 *
 *   For this demo to run successfully pin P0.11(Soft TX) must be connected to
 *   P1.7(True TX) and pin P1.5(Soft RX) must be connected to P1.6(True RX).
 *   A PC or similar equipment capable of handling ASCII data at 9600 bit/s must be
 *   connected to the UART0 of the microcontroller. P1.7 and P1.6 are configured
 *   as GPIO pins and inactive mode (no pull-down/pull-up resistor enabled)
 *   in order not to influence the communication of soft uart.
 *
 *   UART0 of the LPC11xx/LPC13XX is not used in this demo.
 *   Regular U0Tx and U0Rx functionality is replaced by the software uart pins.
 *   UART0 pins are selected because most of the development boards already have needed
 *   hardware for voltage translation between the microcontroller and an
 *   external device.
 *   LPC1114:
 *   fosc = 12 MHz; PLL is used; System clock = AHB clock =48Mhz
 *   LPC1343:
 *   fosc = 12 MHz; PLL is used; System clock = AHB clock =72Mhz*
 ***********************************************************************
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
 **********************************************************************/


/*
* Pin list:                                                                     
* P1.7:           [GPIO]  - Peripheral UART pin put in inactive mode
* P1.6:           [GPIO]  - Peripheral UART pin put in inactive mode
* P3.0:   TX_PRO  [GPO]   - TX parameter processing indicator (active low)
* P3.1:   INT     [GPO]   - TIMER  interrupt indicator (active low)
* P3.2:   INT_TX  [GPO]   - swu tx interrupt indicator (active low)   
* P3.3:   INT_RX  [GPO]   - swu rx interrupt indicator (active low)  
* P1.11:  CALL    [GPO]   - tx UART routine call indicator (active low)
* P0.11:  SWU_Tx  [MAT0.3]- software UART Tx pin                        
* P1.5:   SWU_RX  [CAP0.0]- software UART Rx pin   
*
*********************************************************/
#include "driver_config.h"
#include "target_config.h"

#include "gpio.h"
#include "lpc_swu.h"

/*********************************************************
** Global Variables                                     **
*********************************************************/                        
//store incoming character as well as flag bit
static volatile unsigned short rxData;

/******************************************************************************
** Function name:   TIMER32_0_IRQHandler
**
** Descriptions:    Timer/Counter 0 interrupt handler.
** 					Depending on need, RX and TX routines can use separate timer
** 					In the event that only RX or TX is needed, unused call can
** 					be removed to reduce ISR activity.
**
** parameters:	    None
** Returned value:  None
**
******************************************************************************/
void TIMER32_0_IRQHandler(void)
{
	GPIOSetValue(PORT_INT,PIN_INT,0); //Enable activity indicator

	//In TX only applications swu_isr_rx can be commented
	swu_isr_rx(LPC_TMR32B0);
	swu_isr_tx(LPC_TMR32B0);

	GPIOSetValue(PORT_INT,PIN_INT,1); //Disable activity indicator
}


/******************************************************************************
** Function name: 	swu_rx_callback
**
** Descriptions:	Overload default call-back. This function runs in the
** 					interrupt's context, so it should do very little. In this
** 					case it simply buffers the received character and sets a
** 					flag so main() can process the character outside the
** 					interrupt.
**
** Parameters:  	None
** Returned value:  None
**
******************************************************************************/
void swu_rx_callback(void)
{
	//append flag bit to character
	rxData = 0x100 + swu_rx_chr();
	return;
}

void displayWelcome(void)
{
	swu_tx_str( (unsigned char*) "Software UART demo code\r\n");
	swu_tx_str( (unsigned char*) "=======================================================\r\n");
	swu_tx_str( (unsigned char*) "This application echoes characters entered by the user.\r\n");
	swu_tx_str( (unsigned char*) "Echo:");
}

/******************************************************************************
** Function name: 	main
**
** Descriptions:	Set up software UART.
** 					Display welcome message to user.
** 					Receive and echo characters.
**
** Parameters:  	None
** Returned value:  None
**
******************************************************************************/
int main (void)
{
	unsigned char buffChar;
	SystemInit();

	/* Enable AHB clock to the GPIO domain. */
	LPC_SYSCON->SYSAHBCLKCTRL |= (1<<6);

	//config P1.6,P1.7 as GPIO, no pull-up/pull down resistor
	LPC_IOCON->PIO1_6 &= ~0x3F;
	LPC_IOCON->PIO1_7 &= ~0x3F;

	/* config indicator pins   */
	GPIOSetDir( PORT_TX_PRO, PIN_TX_PRO, 1 );       //pin_txpro
	GPIOSetDir( PORT_INT, PIN_INT, 1 );             //pin_int
	GPIOSetDir( PORT_INT_TX, PIN_INT_TX, 1 );       //INT_TX
	GPIOSetDir( PORT_INT_RX, PIN_INT_RX, 1 );       //INT_RX
	GPIOSetDir( PORT_CALL, PIN_CALL, 1 );           //CALL

	GPIOSetValue(PORT_TX_PRO,PIN_TX_PRO,1);         //set indicator pins to high
	GPIOSetValue(PORT_INT,PIN_INT,1);
	GPIOSetValue(PORT_INT_TX,PIN_INT_TX,1);
	GPIOSetValue(PORT_INT_RX,PIN_INT_RX,1);
	GPIOSetValue(PORT_CALL,PIN_CALL,1);

	//setup the software uart
	swu_init(LPC_TMR32B0);

	//main demo code outputs a greeting message and
	//waits for user's input to echo it
	displayWelcome();


	while(1)
	{
		if (rxData & 0x100)//valid flag indicating new character
		{
			buffChar = (unsigned char) rxData & 0xFF;
			if (buffChar=='\r')
			{
				swu_tx_str( (unsigned char*) "\r\nEcho:");
			}
			else
			{
				//transmit the last received char
				swu_tx_chr( buffChar );
			}
			rxData=0;
		}
	}
}
