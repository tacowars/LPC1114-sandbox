

NXP LPCXpresso LPC1114 FreeRTOS Example V1.0 7/6/2010

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

This example project builds in LPCXpresso and demonstrates using FreeRTOS
to create 4 threads which interact with peripherals on the LPCXpresso
board as well as the Embedded Artists baseboard. 

This project is configured to use preemptive multitasking. Threads can be
created that monopolize the processing time of the MCU, yet other threads will
continue to run (processing resources will be shared) and timer events will be
handled.

The four threads are created in main.c. They are:

2 LED blinking threads. They both toggle port P0.7 at different intervals.
As they do not run in sync, the LED flash duration varies.

1 thread prints "Heartbeat" using debugger semihosting every 3 seconds.

The last thread counts from 0 through 9 on the LED display on the EA baseboard.


The code for the sample threads is in the src folder. To configure FreeRTOS
parameters, see the FreeRTOSConfig.h file in the inc folder. Some items that
may need to be changes for a typical application include the thread stack sizes.
There is a #define in FreeRTOSConfig.h defining a reasonable minimum stack size,
but the stack size can be specified for each thread in main.c. Stack checking
is enabled. In the event of a stack overflow, an error message will print out
in the LPCXpresso debugger listing the task name, via semihosting.
configTOTAL_HEAP_SIZE may also need to be adjusted. All thread stack is
dynamically allocated at runtime from a block of memory configTOTAL_HEAP_SIZE
bytes long.

The task context switch rate (SysTick interrupt interval) is set at 1000
switches per second. This is higher than needed for some applications and will
waste CPU resources (power) but will achieve smoother multitasking. A typical
value is 100.

This project is configured to enter sleep mode and save power when it is idle. This
happens whenever none of the tasks are running. Another idle activity could be
substituted by modifying the vApplicationIdleHook function in main.c.

