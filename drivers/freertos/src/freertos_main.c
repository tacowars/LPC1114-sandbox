/***********************************************************************
 * $Id:: freertos_main.c 4785 2010-09-03 22:39:27Z nxp21346            $
 *
 *     Copyright (C) 2010 NXP Semiconductors.
 *
 * Description:
 *     This example project builds in LPCXpresso and demonstrates using
 *     FreeRTOS to create 4 threads which interact with peripherals on
 *     the LPCXpresso board as well as the Embedded Artists baseboard.
 *
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

#include "driver_config.h"
#include "target_config.h"

#include "small_gpio.h"
#include "debug_printf.h"

#include "FreeRTOS.h"
#include "task.h"

// This function is called whenever FreeRTOS detects a stack overflow.
void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed portCHAR *pcTaskName )
{
	debug_puts("Stack overflow in thread: ");
	debug_puts((char *)pcTaskName);
}

void vTaskLEDBlinker1(void *pvParameters)
{
	while(1)
	{
		ToggleGPIOBit(0, 7);
		vTaskDelay(configTICK_RATE_HZ*193/2000);
	}
}

void vTaskLEDBlinker2(void *pvParameters)
{
	while(1)
	{
		ToggleGPIOBit(1, 9);
		ToggleGPIOBit(1, 10);
		vTaskDelay(configTICK_RATE_HZ*199/2000);
	}
}

void vTaskDebuggerHeartbeat(void *pvParameters)
{
	while(1)
	{
		debug_puts("Heartbeat");
		vTaskDelay(configTICK_RATE_HZ*3);
	}
}

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

    ClrGPIOBit(1, 11);

	if(n < 0)
		n = 0;
	else
		n = segmentlut[n];

    for(i=0;i<8;i++)
    {
    	if((n>>(7-i))&1)
    		ClrGPIOBit(0, 9);
    	else
    	    SetGPIOBit(0, 9);
    	ClrGPIOBit(2, 11);
    	SetGPIOBit(2, 11);
    }
    SetGPIOBit(1, 11);
}

void Init7Segment(void)
{
    // Turn off 7-segment display
    SetGPIOOut(0, 9); // MOSI
    SetGPIOOut(2, 11); // CLK
    SetGPIOOut(1, 11); // CS
    ClrGPIOBit(1, 11);
    SetSegment(-1);
}

void vTask7SegmentCounter(void *pvParameters)
{
	int i=0;

	Init7Segment();

	while(1)
	{
		if(i>9) i = 0;
		SetSegment(i++);
		vTaskDelay(configTICK_RATE_HZ/2);
	}
}
void vApplicationIdleHook( void )
{
	__WFI();
}
int main(void)
{
//	unsigned char ParameterToPass;
	
	SetGPIOOut(0, 7);
	SetGPIOOut(1, 9);//Red
	SetGPIOOut(1, 10);//Green
	SetGPIOBit(1, 9);
	ClrGPIOBit(1,10);

	debug_puts("Starting 4 tasks. Two LED blinkers, a 7-segment counter, and a Semihost-printf heartbeat.\n");
	debug_puts("Make sure to compile in release mode to use this code without the debugger.\n");

	xTaskCreate( vTaskLEDBlinker1, (const signed portCHAR * const) "while", configMINIMAL_STACK_SIZE,
			NULL, 3, NULL);
	xTaskCreate( vTaskLEDBlinker2, (const signed portCHAR * const)"while2", configMINIMAL_STACK_SIZE,
			NULL, 3, NULL);
	xTaskCreate( vTaskDebuggerHeartbeat, (const signed portCHAR * const)"ping", configMINIMAL_STACK_SIZE,
			NULL, 3, NULL);
	xTaskCreate( vTask7SegmentCounter, (const signed portCHAR * const)"counter", configMINIMAL_STACK_SIZE,
			NULL, 3, NULL);
	
	vTaskStartScheduler(); // does not return

	debug_puts("The task scheduler failed to start. This happens when configTOTAL_HEAP_SIZE is not large enough.\n");

	// Enter an infinite loop, just incrementing a counter
	volatile static int i = 0 ;
	while(1) {
		i++ ;
	}
	return 0 ;
}
