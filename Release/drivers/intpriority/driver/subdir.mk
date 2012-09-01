################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/intpriority/driver/adc.c \
../drivers/intpriority/driver/can.c \
../drivers/intpriority/driver/clkconfig.c \
../drivers/intpriority/driver/crp.c \
../drivers/intpriority/driver/debug_printf.c \
../drivers/intpriority/driver/gpio.c \
../drivers/intpriority/driver/i2c.c \
../drivers/intpriority/driver/i2cslave.c \
../drivers/intpriority/driver/lpc_swu.c \
../drivers/intpriority/driver/rs485.c \
../drivers/intpriority/driver/small_gpio.c \
../drivers/intpriority/driver/ssp.c \
../drivers/intpriority/driver/timer16.c \
../drivers/intpriority/driver/timer32.c \
../drivers/intpriority/driver/uart.c \
../drivers/intpriority/driver/wdt.c 

OBJS += \
./drivers/intpriority/driver/adc.o \
./drivers/intpriority/driver/can.o \
./drivers/intpriority/driver/clkconfig.o \
./drivers/intpriority/driver/crp.o \
./drivers/intpriority/driver/debug_printf.o \
./drivers/intpriority/driver/gpio.o \
./drivers/intpriority/driver/i2c.o \
./drivers/intpriority/driver/i2cslave.o \
./drivers/intpriority/driver/lpc_swu.o \
./drivers/intpriority/driver/rs485.o \
./drivers/intpriority/driver/small_gpio.o \
./drivers/intpriority/driver/ssp.o \
./drivers/intpriority/driver/timer16.o \
./drivers/intpriority/driver/timer32.o \
./drivers/intpriority/driver/uart.o \
./drivers/intpriority/driver/wdt.o 

C_DEPS += \
./drivers/intpriority/driver/adc.d \
./drivers/intpriority/driver/can.d \
./drivers/intpriority/driver/clkconfig.d \
./drivers/intpriority/driver/crp.d \
./drivers/intpriority/driver/debug_printf.d \
./drivers/intpriority/driver/gpio.d \
./drivers/intpriority/driver/i2c.d \
./drivers/intpriority/driver/i2cslave.d \
./drivers/intpriority/driver/lpc_swu.d \
./drivers/intpriority/driver/rs485.d \
./drivers/intpriority/driver/small_gpio.d \
./drivers/intpriority/driver/ssp.d \
./drivers/intpriority/driver/timer16.d \
./drivers/intpriority/driver/timer32.d \
./drivers/intpriority/driver/uart.d \
./drivers/intpriority/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/intpriority/driver/%.o: ../drivers/intpriority/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


