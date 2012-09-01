################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/extint/driver/adc.c \
../drivers/extint/driver/can.c \
../drivers/extint/driver/clkconfig.c \
../drivers/extint/driver/crp.c \
../drivers/extint/driver/debug_printf.c \
../drivers/extint/driver/gpio.c \
../drivers/extint/driver/i2c.c \
../drivers/extint/driver/i2cslave.c \
../drivers/extint/driver/lpc_swu.c \
../drivers/extint/driver/rs485.c \
../drivers/extint/driver/small_gpio.c \
../drivers/extint/driver/ssp.c \
../drivers/extint/driver/timer16.c \
../drivers/extint/driver/timer32.c \
../drivers/extint/driver/uart.c \
../drivers/extint/driver/wdt.c 

OBJS += \
./drivers/extint/driver/adc.o \
./drivers/extint/driver/can.o \
./drivers/extint/driver/clkconfig.o \
./drivers/extint/driver/crp.o \
./drivers/extint/driver/debug_printf.o \
./drivers/extint/driver/gpio.o \
./drivers/extint/driver/i2c.o \
./drivers/extint/driver/i2cslave.o \
./drivers/extint/driver/lpc_swu.o \
./drivers/extint/driver/rs485.o \
./drivers/extint/driver/small_gpio.o \
./drivers/extint/driver/ssp.o \
./drivers/extint/driver/timer16.o \
./drivers/extint/driver/timer32.o \
./drivers/extint/driver/uart.o \
./drivers/extint/driver/wdt.o 

C_DEPS += \
./drivers/extint/driver/adc.d \
./drivers/extint/driver/can.d \
./drivers/extint/driver/clkconfig.d \
./drivers/extint/driver/crp.d \
./drivers/extint/driver/debug_printf.d \
./drivers/extint/driver/gpio.d \
./drivers/extint/driver/i2c.d \
./drivers/extint/driver/i2cslave.d \
./drivers/extint/driver/lpc_swu.d \
./drivers/extint/driver/rs485.d \
./drivers/extint/driver/small_gpio.d \
./drivers/extint/driver/ssp.d \
./drivers/extint/driver/timer16.d \
./drivers/extint/driver/timer32.d \
./drivers/extint/driver/uart.d \
./drivers/extint/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/extint/driver/%.o: ../drivers/extint/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


