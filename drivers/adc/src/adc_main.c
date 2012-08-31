/*****************************************************************************
 *   adctest.c:  main C entry file for NXP LPC11xx Family Microprocessors
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

#include "adc.h"
#include "debug_printf.h"

#ifdef ADC_DEBUG
uint8_t ConvertDigital ( uint8_t digital )
{
  uint8_t ascii_char;

  if ( (digital >= 0) && (digital <= 9) )
  {
	ascii_char = digital + 0x30;	/* 0~9 */
  }
  else
  {
	ascii_char = digital - 0x0A;
	ascii_char += 0x41;				/* A~F */
  }
  return ( ascii_char );
}
#endif

#ifdef ADC_DEBUG
#define BAR_OUTPUT_LENGTH 60
#define ADC_COUNT_MAX 1023
#define CHANNEL_WIDTH 2
#define VOLT_WIDTH 4
#define MAX_BAR_LENGTH (BAR_OUTPUT_LENGTH-CHANNEL_WIDTH-1-VOLT_WIDTH-1-2)
#define SUPPLY_VOLTAGE 3.30

void FillString(char *s, char c, uint32_t len)
{
	if(!len)
		goto empty;
	while(--len)
		*s++ = c;
empty:
	*s = 0;
}
void ADCBar(int32_t Channel, uint32_t Counts)
{
	uint32_t ValueBarLen = ((Counts * (MAX_BAR_LENGTH+1)) - (ADC_COUNT_MAX/2 - 1)) / ADC_COUNT_MAX;
	char ValueBarBuf[BAR_OUTPUT_LENGTH+1];
	double ValueVolts = Counts*SUPPLY_VOLTAGE/ADC_COUNT_MAX;

	if(Channel >= 0)
	{
		if(ValueBarLen > MAX_BAR_LENGTH) ValueBarLen = MAX_BAR_LENGTH;
		FillString(ValueBarBuf, '#', ValueBarLen);
		debug_printf("%2d %d.%02dV |%s%*s|\n", (int)Channel,
				(int)ValueVolts, (int)((ValueVolts-(int)ValueVolts)*100),
				ValueBarBuf, (int)(MAX_BAR_LENGTH-ValueBarLen), "");
	}
	else
	{
		FillString(ValueBarBuf, '-', MAX_BAR_LENGTH+2);
		debug_printf("%-9s%s\n", "", ValueBarBuf);
	}
}
#endif

/******************************************************************************
**   Main Function  main()
******************************************************************************/
int main (void)
{
	 /* Basic chip initialization is taken care of in SystemInit() called
	   * from the startup code. SystemInit() and chip settings are defined
	   * in the CMSIS system_<part family>.c file.
	   */

  uint32_t i;

  /* Initialize ADC  */
  ADCInit( ADC_CLK );

  while(1)
  {
#if CONFIG_ADC_ENABLE_BURST_MODE==1				/* Interrupt driven only */
	ADCBurstRead();
	while ( !ADC0IntDone );
	ADC0IntDone = 0;
#else						/* Not burst mode */
#if CONFIG_ADC_ENABLE_ADC_IRQHANDLER==1		/* Interrupt driven */
	for ( i = 0; i < ADC_NUM; i++ )
	{
	  ADCRead( i );
	  while ( !ADCIntDone );
	  ADCIntDone = 0;
	}
#else  						/* Polling */
	for ( i = 0; i < ADC_NUM; i++ )
	{
	  ADCValue[i] = ADCRead( i );
	}
#endif	/* Endif interrupt driven */
#endif	/* Endif BURST mode */
#ifdef SEMIHOSTED_ADC_OUTPUT
#ifndef OUTPUT_ONLY_CH0
	for ( i = 0; i < ADC_NUM; i++ )
	{
		ADCBar(i, ADCValue[i]);
	}
#else
	ADCBar(0, ADCValue[0]);
#endif
#endif
	}
}

/******************************************************************************
**                            End Of File
******************************************************************************/

