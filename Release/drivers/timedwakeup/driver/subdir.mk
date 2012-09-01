################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/timedwakeup/driver/adc.c \
../drivers/timedwakeup/driver/can.c \
../drivers/timedwakeup/driver/clkconfig.c \
../drivers/timedwakeup/driver/crp.c \
../drivers/timedwakeup/driver/debug_printf.c \
../drivers/timedwakeup/driver/gpio.c \
../drivers/timedwakeup/driver/i2c.c \
../drivers/timedwakeup/driver/i2cslave.c \
../drivers/timedwakeup/driver/lpc_swu.c \
../drivers/timedwakeup/driver/rs485.c \
../drivers/timedwakeup/driver/small_gpio.c \
../drivers/timedwakeup/driver/ssp.c \
../drivers/timedwakeup/driver/timer16.c \
../drivers/timedwakeup/driver/timer32.c \
../drivers/timedwakeup/driver/uart.c \
../drivers/timedwakeup/driver/wdt.c 

OBJS += \
./drivers/timedwakeup/driver/adc.o \
./drivers/timedwakeup/driver/can.o \
./drivers/timedwakeup/driver/clkconfig.o \
./drivers/timedwakeup/driver/crp.o \
./drivers/timedwakeup/driver/debug_printf.o \
./drivers/timedwakeup/driver/gpio.o \
./drivers/timedwakeup/driver/i2c.o \
./drivers/timedwakeup/driver/i2cslave.o \
./drivers/timedwakeup/driver/lpc_swu.o \
./drivers/timedwakeup/driver/rs485.o \
./drivers/timedwakeup/driver/small_gpio.o \
./drivers/timedwakeup/driver/ssp.o \
./drivers/timedwakeup/driver/timer16.o \
./drivers/timedwakeup/driver/timer32.o \
./drivers/timedwakeup/driver/uart.o \
./drivers/timedwakeup/driver/wdt.o 

C_DEPS += \
./drivers/timedwakeup/driver/adc.d \
./drivers/timedwakeup/driver/can.d \
./drivers/timedwakeup/driver/clkconfig.d \
./drivers/timedwakeup/driver/crp.d \
./drivers/timedwakeup/driver/debug_printf.d \
./drivers/timedwakeup/driver/gpio.d \
./drivers/timedwakeup/driver/i2c.d \
./drivers/timedwakeup/driver/i2cslave.d \
./drivers/timedwakeup/driver/lpc_swu.d \
./drivers/timedwakeup/driver/rs485.d \
./drivers/timedwakeup/driver/small_gpio.d \
./drivers/timedwakeup/driver/ssp.d \
./drivers/timedwakeup/driver/timer16.d \
./drivers/timedwakeup/driver/timer32.d \
./drivers/timedwakeup/driver/uart.d \
./drivers/timedwakeup/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/timedwakeup/driver/%.o: ../drivers/timedwakeup/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


