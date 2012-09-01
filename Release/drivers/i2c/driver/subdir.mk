################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/i2c/driver/adc.c \
../drivers/i2c/driver/can.c \
../drivers/i2c/driver/clkconfig.c \
../drivers/i2c/driver/crp.c \
../drivers/i2c/driver/debug_printf.c \
../drivers/i2c/driver/gpio.c \
../drivers/i2c/driver/i2c.c \
../drivers/i2c/driver/i2cslave.c \
../drivers/i2c/driver/lpc_swu.c \
../drivers/i2c/driver/rs485.c \
../drivers/i2c/driver/small_gpio.c \
../drivers/i2c/driver/ssp.c \
../drivers/i2c/driver/timer16.c \
../drivers/i2c/driver/timer32.c \
../drivers/i2c/driver/uart.c \
../drivers/i2c/driver/wdt.c 

OBJS += \
./drivers/i2c/driver/adc.o \
./drivers/i2c/driver/can.o \
./drivers/i2c/driver/clkconfig.o \
./drivers/i2c/driver/crp.o \
./drivers/i2c/driver/debug_printf.o \
./drivers/i2c/driver/gpio.o \
./drivers/i2c/driver/i2c.o \
./drivers/i2c/driver/i2cslave.o \
./drivers/i2c/driver/lpc_swu.o \
./drivers/i2c/driver/rs485.o \
./drivers/i2c/driver/small_gpio.o \
./drivers/i2c/driver/ssp.o \
./drivers/i2c/driver/timer16.o \
./drivers/i2c/driver/timer32.o \
./drivers/i2c/driver/uart.o \
./drivers/i2c/driver/wdt.o 

C_DEPS += \
./drivers/i2c/driver/adc.d \
./drivers/i2c/driver/can.d \
./drivers/i2c/driver/clkconfig.d \
./drivers/i2c/driver/crp.d \
./drivers/i2c/driver/debug_printf.d \
./drivers/i2c/driver/gpio.d \
./drivers/i2c/driver/i2c.d \
./drivers/i2c/driver/i2cslave.d \
./drivers/i2c/driver/lpc_swu.d \
./drivers/i2c/driver/rs485.d \
./drivers/i2c/driver/small_gpio.d \
./drivers/i2c/driver/ssp.d \
./drivers/i2c/driver/timer16.d \
./drivers/i2c/driver/timer32.d \
./drivers/i2c/driver/uart.d \
./drivers/i2c/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/i2c/driver/%.o: ../drivers/i2c/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


