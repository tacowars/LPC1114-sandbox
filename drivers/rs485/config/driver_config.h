/*
 * driver_config.h
 *
 *  Created on: Aug 31, 2010
 *      Author: nxp28548
 */

#ifndef DRIVER_CONFIG_H_
#define DRIVER_CONFIG_H

#include <LPC11xx.h>

#define CONFIG_ENABLE_DRIVER_CRP						1
#define CONFIG_CRP_SETTING_NO_CRP						1

#define CONFIG_ENABLE_DRIVER_RS485						1
#define CONFIG_RS485_DEFAULT_UART_IRQHANDLER			1
#define RS485_RX										1		/* 1 is RX, 0 is TX. */
#define CONFIG_ENABLE_DRIVER_GPIO						1

/* DRIVER_CONFIG_H_ */
#endif
