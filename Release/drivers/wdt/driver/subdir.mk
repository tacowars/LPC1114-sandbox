################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/wdt/driver/adc.c \
../drivers/wdt/driver/can.c \
../drivers/wdt/driver/clkconfig.c \
../drivers/wdt/driver/crp.c \
../drivers/wdt/driver/debug_printf.c \
../drivers/wdt/driver/gpio.c \
../drivers/wdt/driver/i2c.c \
../drivers/wdt/driver/i2cslave.c \
../drivers/wdt/driver/lpc_swu.c \
../drivers/wdt/driver/rs485.c \
../drivers/wdt/driver/small_gpio.c \
../drivers/wdt/driver/ssp.c \
../drivers/wdt/driver/timer16.c \
../drivers/wdt/driver/timer32.c \
../drivers/wdt/driver/uart.c \
../drivers/wdt/driver/wdt.c 

OBJS += \
./drivers/wdt/driver/adc.o \
./drivers/wdt/driver/can.o \
./drivers/wdt/driver/clkconfig.o \
./drivers/wdt/driver/crp.o \
./drivers/wdt/driver/debug_printf.o \
./drivers/wdt/driver/gpio.o \
./drivers/wdt/driver/i2c.o \
./drivers/wdt/driver/i2cslave.o \
./drivers/wdt/driver/lpc_swu.o \
./drivers/wdt/driver/rs485.o \
./drivers/wdt/driver/small_gpio.o \
./drivers/wdt/driver/ssp.o \
./drivers/wdt/driver/timer16.o \
./drivers/wdt/driver/timer32.o \
./drivers/wdt/driver/uart.o \
./drivers/wdt/driver/wdt.o 

C_DEPS += \
./drivers/wdt/driver/adc.d \
./drivers/wdt/driver/can.d \
./drivers/wdt/driver/clkconfig.d \
./drivers/wdt/driver/crp.d \
./drivers/wdt/driver/debug_printf.d \
./drivers/wdt/driver/gpio.d \
./drivers/wdt/driver/i2c.d \
./drivers/wdt/driver/i2cslave.d \
./drivers/wdt/driver/lpc_swu.d \
./drivers/wdt/driver/rs485.d \
./drivers/wdt/driver/small_gpio.d \
./drivers/wdt/driver/ssp.d \
./drivers/wdt/driver/timer16.d \
./drivers/wdt/driver/timer32.d \
./drivers/wdt/driver/uart.d \
./drivers/wdt/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/wdt/driver/%.o: ../drivers/wdt/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


