/****************************************************************************
 *   $Id:: invokeisp_main.c 4816 2010-09-07 17:24:10Z nxp21346                        $
 *   Project: NXP LPC11xx invokeisp example
 *
 *   Description:
 *     This file contains the main routine for the invokeisp code sample
 *     which puts an LPC111x part in UART ISP mode by using the IAP API.
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

/* This data must be global so it is not read from the stack */
typedef void (*IAP)(uint32_t [], uint32_t []);
IAP iap_entry = (IAP)0x1fff1ff1;
uint32_t command[5], result[4];

/* This function resets some microcontroller peripherals to reset
   hardware configuration to ensure that the In-System Programming module
   will work properly. ISP is normally called from reset and assumes some reset
   configuration settings for the MCU.
   Some of the peripheral configurations may be redundant in your specific
   project.
*/
void ReinvokeISP(void)
{
  /* make sure 32-bit Timer 1 is turned on before calling ISP */
  LPC_SYSCON->SYSAHBCLKCTRL |= 0x00400;
  /* make sure GPIO clock is turned on before calling ISP */
  LPC_SYSCON->SYSAHBCLKCTRL |= 0x00040;
  /* make sure IO configuration clock is turned on before calling ISP */
  LPC_SYSCON->SYSAHBCLKCTRL |= 0x10000;
  /* make sure AHB clock divider is 1:1 */
  LPC_SYSCON->SYSAHBCLKDIV = 1;

  /* Send Reinvoke ISP command to ISP entry point*/
  command[0] = 57;

  /* Set stack pointer to ROM value (reset default) This must be the last
     piece of code executed before calling ISP, because most C expressions
     and function returns will fail after the stack pointer is changed. */
  __set_MSP(*((uint32_t *)0x1FFF0000)); /* inline asm function */

  /* Invoke ISP. We call "iap_entry" to invoke ISP because the ISP entry is done
     through the same command interface as IAP. */
  iap_entry(command, result);
  // Not supposed to come back!
}

/* Main Program */
int main()
{
  /* Basic chip initialization is taken care of in SystemInit() called
   * from the startup code. Chip settings are defined in the CMSIS
   * system_<part family>.c file.
   */

  /* Start ISP- does not return */
  ReinvokeISP();

  return 0;
}

