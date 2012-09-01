################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/i2cslave/driver/adc.c \
../drivers/i2cslave/driver/can.c \
../drivers/i2cslave/driver/clkconfig.c \
../drivers/i2cslave/driver/crp.c \
../drivers/i2cslave/driver/debug_printf.c \
../drivers/i2cslave/driver/gpio.c \
../drivers/i2cslave/driver/i2c.c \
../drivers/i2cslave/driver/i2cslave.c \
../drivers/i2cslave/driver/lpc_swu.c \
../drivers/i2cslave/driver/rs485.c \
../drivers/i2cslave/driver/small_gpio.c \
../drivers/i2cslave/driver/ssp.c \
../drivers/i2cslave/driver/timer16.c \
../drivers/i2cslave/driver/timer32.c \
../drivers/i2cslave/driver/uart.c \
../drivers/i2cslave/driver/wdt.c 

OBJS += \
./drivers/i2cslave/driver/adc.o \
./drivers/i2cslave/driver/can.o \
./drivers/i2cslave/driver/clkconfig.o \
./drivers/i2cslave/driver/crp.o \
./drivers/i2cslave/driver/debug_printf.o \
./drivers/i2cslave/driver/gpio.o \
./drivers/i2cslave/driver/i2c.o \
./drivers/i2cslave/driver/i2cslave.o \
./drivers/i2cslave/driver/lpc_swu.o \
./drivers/i2cslave/driver/rs485.o \
./drivers/i2cslave/driver/small_gpio.o \
./drivers/i2cslave/driver/ssp.o \
./drivers/i2cslave/driver/timer16.o \
./drivers/i2cslave/driver/timer32.o \
./drivers/i2cslave/driver/uart.o \
./drivers/i2cslave/driver/wdt.o 

C_DEPS += \
./drivers/i2cslave/driver/adc.d \
./drivers/i2cslave/driver/can.d \
./drivers/i2cslave/driver/clkconfig.d \
./drivers/i2cslave/driver/crp.d \
./drivers/i2cslave/driver/debug_printf.d \
./drivers/i2cslave/driver/gpio.d \
./drivers/i2cslave/driver/i2c.d \
./drivers/i2cslave/driver/i2cslave.d \
./drivers/i2cslave/driver/lpc_swu.d \
./drivers/i2cslave/driver/rs485.d \
./drivers/i2cslave/driver/small_gpio.d \
./drivers/i2cslave/driver/ssp.d \
./drivers/i2cslave/driver/timer16.d \
./drivers/i2cslave/driver/timer32.d \
./drivers/i2cslave/driver/uart.d \
./drivers/i2cslave/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/i2cslave/driver/%.o: ../drivers/i2cslave/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


