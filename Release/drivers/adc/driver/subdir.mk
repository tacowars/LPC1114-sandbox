################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/adc/driver/adc.c \
../drivers/adc/driver/can.c \
../drivers/adc/driver/clkconfig.c \
../drivers/adc/driver/crp.c \
../drivers/adc/driver/debug_printf.c \
../drivers/adc/driver/gpio.c \
../drivers/adc/driver/i2c.c \
../drivers/adc/driver/i2cslave.c \
../drivers/adc/driver/lpc_swu.c \
../drivers/adc/driver/rs485.c \
../drivers/adc/driver/small_gpio.c \
../drivers/adc/driver/ssp.c \
../drivers/adc/driver/timer16.c \
../drivers/adc/driver/timer32.c \
../drivers/adc/driver/uart.c \
../drivers/adc/driver/wdt.c 

OBJS += \
./drivers/adc/driver/adc.o \
./drivers/adc/driver/can.o \
./drivers/adc/driver/clkconfig.o \
./drivers/adc/driver/crp.o \
./drivers/adc/driver/debug_printf.o \
./drivers/adc/driver/gpio.o \
./drivers/adc/driver/i2c.o \
./drivers/adc/driver/i2cslave.o \
./drivers/adc/driver/lpc_swu.o \
./drivers/adc/driver/rs485.o \
./drivers/adc/driver/small_gpio.o \
./drivers/adc/driver/ssp.o \
./drivers/adc/driver/timer16.o \
./drivers/adc/driver/timer32.o \
./drivers/adc/driver/uart.o \
./drivers/adc/driver/wdt.o 

C_DEPS += \
./drivers/adc/driver/adc.d \
./drivers/adc/driver/can.d \
./drivers/adc/driver/clkconfig.d \
./drivers/adc/driver/crp.d \
./drivers/adc/driver/debug_printf.d \
./drivers/adc/driver/gpio.d \
./drivers/adc/driver/i2c.d \
./drivers/adc/driver/i2cslave.d \
./drivers/adc/driver/lpc_swu.d \
./drivers/adc/driver/rs485.d \
./drivers/adc/driver/small_gpio.d \
./drivers/adc/driver/ssp.d \
./drivers/adc/driver/timer16.d \
./drivers/adc/driver/timer32.d \
./drivers/adc/driver/uart.d \
./drivers/adc/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/adc/driver/%.o: ../drivers/adc/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


