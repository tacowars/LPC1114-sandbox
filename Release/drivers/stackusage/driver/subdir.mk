################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/stackusage/driver/adc.c \
../drivers/stackusage/driver/can.c \
../drivers/stackusage/driver/clkconfig.c \
../drivers/stackusage/driver/crp.c \
../drivers/stackusage/driver/debug_printf.c \
../drivers/stackusage/driver/gpio.c \
../drivers/stackusage/driver/i2c.c \
../drivers/stackusage/driver/i2cslave.c \
../drivers/stackusage/driver/lpc_swu.c \
../drivers/stackusage/driver/rs485.c \
../drivers/stackusage/driver/small_gpio.c \
../drivers/stackusage/driver/ssp.c \
../drivers/stackusage/driver/timer16.c \
../drivers/stackusage/driver/timer32.c \
../drivers/stackusage/driver/uart.c \
../drivers/stackusage/driver/wdt.c 

OBJS += \
./drivers/stackusage/driver/adc.o \
./drivers/stackusage/driver/can.o \
./drivers/stackusage/driver/clkconfig.o \
./drivers/stackusage/driver/crp.o \
./drivers/stackusage/driver/debug_printf.o \
./drivers/stackusage/driver/gpio.o \
./drivers/stackusage/driver/i2c.o \
./drivers/stackusage/driver/i2cslave.o \
./drivers/stackusage/driver/lpc_swu.o \
./drivers/stackusage/driver/rs485.o \
./drivers/stackusage/driver/small_gpio.o \
./drivers/stackusage/driver/ssp.o \
./drivers/stackusage/driver/timer16.o \
./drivers/stackusage/driver/timer32.o \
./drivers/stackusage/driver/uart.o \
./drivers/stackusage/driver/wdt.o 

C_DEPS += \
./drivers/stackusage/driver/adc.d \
./drivers/stackusage/driver/can.d \
./drivers/stackusage/driver/clkconfig.d \
./drivers/stackusage/driver/crp.d \
./drivers/stackusage/driver/debug_printf.d \
./drivers/stackusage/driver/gpio.d \
./drivers/stackusage/driver/i2c.d \
./drivers/stackusage/driver/i2cslave.d \
./drivers/stackusage/driver/lpc_swu.d \
./drivers/stackusage/driver/rs485.d \
./drivers/stackusage/driver/small_gpio.d \
./drivers/stackusage/driver/ssp.d \
./drivers/stackusage/driver/timer16.d \
./drivers/stackusage/driver/timer32.d \
./drivers/stackusage/driver/uart.d \
./drivers/stackusage/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/stackusage/driver/%.o: ../drivers/stackusage/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


