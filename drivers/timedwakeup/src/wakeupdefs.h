/*
===============================================================================
 Name        : defs.h
 Author      : NXP Semiconductors
 Version     :
 Copyright   : (C) Copyright 2010 NXP Semiconductors
 Description : defs for deep sleep example
===============================================================================
*/

#ifndef DEFS_H_INCLUDED
#define DEFS_H_INCLUDED

#include "LPC11xx.h"

// GPIO bit set routines. Can set and clear multiple bits.
// Pass a mask where the bits you would like to set or clear
// are ones.
#define LPC_GPIO0_DATA ((volatile uint16_t * const)0x50000000)
#define SetBitsPort0(bits) (*(LPC_GPIO0_DATA+(2*bits)) = bits)
#define ClrBitsPort0(bits) (*(LPC_GPIO0_DATA+(2*bits)) = 0)

// BF_ == BitField
#define BF_SCR_SLEEPDEEP (1<<2)

#define BF_PDCFG_IRC          (1<<0 | 1<<1)
#define BF_PDCFG_FLASH        (1<<2)
#define BF_PDCFG_WDTOSC       (1<<6)
#define BF_PDCFG_BOD          (1<<3)
#define BF_PDCFG_RESERVEDMSK  (0xEDFF)
#define BF_STARTLOGIC_P0_8    (1<<8)

#define BF_PDSLEEPCFG_WDT 0x18BF // configuration for Deep Sleep with watchdog oscillator
#define BF_PDSLEEPCFG_WDTBOR 0x18B7 // watchdog and brown-out reset

#define BF_SYSAHBCLKCTRL_SYSCLK   (1<<0)
#define BF_SYSAHBCLKCTRL_ROM      (1<<1)
#define BF_SYSAHBCLKCTRL_RAM      (1<<2)
#define BF_SYSAHBCLKCTRL_FLASHREG (1<<3)
#define BF_SYSAHBCLKCTRL_FLASH    (1<<4)
#define BF_SYSAHBCLKCTRL_GPIO     (1<<6)
#define BF_SYSAHBCLKCTRL_CT16B0   (1<<7)
#define BF_SYSAHBCLKCTRL_IOCON    (1<<16)

#define BF_SYSAHBCLKCTRL_WDT      (1<<15)

#define BF_SYSAHBCLKCTRL_SLEEP     (  BF_SYSAHBCLKCTRL_FLASH    \
                                    | BF_SYSAHBCLKCTRL_RAM      \
                                    | BF_SYSAHBCLKCTRL_CT16B0   \
                                    | BF_SYSAHBCLKCTRL_SYSCLK )


#define WDTCLKSEL_SEL_MAINCLK   1
#define WDTCLKSEL_SEL_WDOSC     2

#define MAINCLKSEL_SEL_IRCOSC   0
#define MAINCLKSEL_SEL_WDOSC    2

#define BF_TIMER_TCR_RESET      (1<<1)
#define BF_TIMER_TCR_RUN        (1<<0)

#define BF_TIMER_MCR_MATCHINTR0  (1<<(0))
#define BF_TIMER_MCR_MATCHRESET0 (1<<(1))
#define BF_TIMER_MCR_MATCHSTOP0  (1<<(2))

#define TIMER_EMR_SETOUT        2
#define BF_TIMER_EMR_SETOUT0    (TIMER_EMR_SETOUT<<4)

#define BF_SYSTICK_COUNTFLAG    (1<<16)

void InitGPIOForSleep(void);
void EnterDeepSleep(void);
void InitDeepSleep(void);
uint32_t MeasureWDO(void);
void Wait1mS(volatile uint32_t i);

#endif
