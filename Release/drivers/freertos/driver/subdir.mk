################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/freertos/driver/adc.c \
../drivers/freertos/driver/can.c \
../drivers/freertos/driver/clkconfig.c \
../drivers/freertos/driver/crp.c \
../drivers/freertos/driver/debug_printf.c \
../drivers/freertos/driver/gpio.c \
../drivers/freertos/driver/i2c.c \
../drivers/freertos/driver/i2cslave.c \
../drivers/freertos/driver/lpc_swu.c \
../drivers/freertos/driver/rs485.c \
../drivers/freertos/driver/small_gpio.c \
../drivers/freertos/driver/ssp.c \
../drivers/freertos/driver/timer16.c \
../drivers/freertos/driver/timer32.c \
../drivers/freertos/driver/uart.c \
../drivers/freertos/driver/wdt.c 

OBJS += \
./drivers/freertos/driver/adc.o \
./drivers/freertos/driver/can.o \
./drivers/freertos/driver/clkconfig.o \
./drivers/freertos/driver/crp.o \
./drivers/freertos/driver/debug_printf.o \
./drivers/freertos/driver/gpio.o \
./drivers/freertos/driver/i2c.o \
./drivers/freertos/driver/i2cslave.o \
./drivers/freertos/driver/lpc_swu.o \
./drivers/freertos/driver/rs485.o \
./drivers/freertos/driver/small_gpio.o \
./drivers/freertos/driver/ssp.o \
./drivers/freertos/driver/timer16.o \
./drivers/freertos/driver/timer32.o \
./drivers/freertos/driver/uart.o \
./drivers/freertos/driver/wdt.o 

C_DEPS += \
./drivers/freertos/driver/adc.d \
./drivers/freertos/driver/can.d \
./drivers/freertos/driver/clkconfig.d \
./drivers/freertos/driver/crp.d \
./drivers/freertos/driver/debug_printf.d \
./drivers/freertos/driver/gpio.d \
./drivers/freertos/driver/i2c.d \
./drivers/freertos/driver/i2cslave.d \
./drivers/freertos/driver/lpc_swu.d \
./drivers/freertos/driver/rs485.d \
./drivers/freertos/driver/small_gpio.d \
./drivers/freertos/driver/ssp.d \
./drivers/freertos/driver/timer16.d \
./drivers/freertos/driver/timer32.d \
./drivers/freertos/driver/uart.d \
./drivers/freertos/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/freertos/driver/%.o: ../drivers/freertos/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


