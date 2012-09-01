################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/swuart/driver/adc.c \
../drivers/swuart/driver/can.c \
../drivers/swuart/driver/clkconfig.c \
../drivers/swuart/driver/crp.c \
../drivers/swuart/driver/debug_printf.c \
../drivers/swuart/driver/gpio.c \
../drivers/swuart/driver/i2c.c \
../drivers/swuart/driver/i2cslave.c \
../drivers/swuart/driver/lpc_swu.c \
../drivers/swuart/driver/rs485.c \
../drivers/swuart/driver/small_gpio.c \
../drivers/swuart/driver/ssp.c \
../drivers/swuart/driver/timer16.c \
../drivers/swuart/driver/timer32.c \
../drivers/swuart/driver/uart.c \
../drivers/swuart/driver/wdt.c 

OBJS += \
./drivers/swuart/driver/adc.o \
./drivers/swuart/driver/can.o \
./drivers/swuart/driver/clkconfig.o \
./drivers/swuart/driver/crp.o \
./drivers/swuart/driver/debug_printf.o \
./drivers/swuart/driver/gpio.o \
./drivers/swuart/driver/i2c.o \
./drivers/swuart/driver/i2cslave.o \
./drivers/swuart/driver/lpc_swu.o \
./drivers/swuart/driver/rs485.o \
./drivers/swuart/driver/small_gpio.o \
./drivers/swuart/driver/ssp.o \
./drivers/swuart/driver/timer16.o \
./drivers/swuart/driver/timer32.o \
./drivers/swuart/driver/uart.o \
./drivers/swuart/driver/wdt.o 

C_DEPS += \
./drivers/swuart/driver/adc.d \
./drivers/swuart/driver/can.d \
./drivers/swuart/driver/clkconfig.d \
./drivers/swuart/driver/crp.d \
./drivers/swuart/driver/debug_printf.d \
./drivers/swuart/driver/gpio.d \
./drivers/swuart/driver/i2c.d \
./drivers/swuart/driver/i2cslave.d \
./drivers/swuart/driver/lpc_swu.d \
./drivers/swuart/driver/rs485.d \
./drivers/swuart/driver/small_gpio.d \
./drivers/swuart/driver/ssp.d \
./drivers/swuart/driver/timer16.d \
./drivers/swuart/driver/timer32.d \
./drivers/swuart/driver/uart.d \
./drivers/swuart/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/swuart/driver/%.o: ../drivers/swuart/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


