################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/rs485/driver/adc.c \
../drivers/rs485/driver/can.c \
../drivers/rs485/driver/clkconfig.c \
../drivers/rs485/driver/crp.c \
../drivers/rs485/driver/debug_printf.c \
../drivers/rs485/driver/gpio.c \
../drivers/rs485/driver/i2c.c \
../drivers/rs485/driver/i2cslave.c \
../drivers/rs485/driver/lpc_swu.c \
../drivers/rs485/driver/rs485.c \
../drivers/rs485/driver/small_gpio.c \
../drivers/rs485/driver/ssp.c \
../drivers/rs485/driver/timer16.c \
../drivers/rs485/driver/timer32.c \
../drivers/rs485/driver/uart.c \
../drivers/rs485/driver/wdt.c 

OBJS += \
./drivers/rs485/driver/adc.o \
./drivers/rs485/driver/can.o \
./drivers/rs485/driver/clkconfig.o \
./drivers/rs485/driver/crp.o \
./drivers/rs485/driver/debug_printf.o \
./drivers/rs485/driver/gpio.o \
./drivers/rs485/driver/i2c.o \
./drivers/rs485/driver/i2cslave.o \
./drivers/rs485/driver/lpc_swu.o \
./drivers/rs485/driver/rs485.o \
./drivers/rs485/driver/small_gpio.o \
./drivers/rs485/driver/ssp.o \
./drivers/rs485/driver/timer16.o \
./drivers/rs485/driver/timer32.o \
./drivers/rs485/driver/uart.o \
./drivers/rs485/driver/wdt.o 

C_DEPS += \
./drivers/rs485/driver/adc.d \
./drivers/rs485/driver/can.d \
./drivers/rs485/driver/clkconfig.d \
./drivers/rs485/driver/crp.d \
./drivers/rs485/driver/debug_printf.d \
./drivers/rs485/driver/gpio.d \
./drivers/rs485/driver/i2c.d \
./drivers/rs485/driver/i2cslave.d \
./drivers/rs485/driver/lpc_swu.d \
./drivers/rs485/driver/rs485.d \
./drivers/rs485/driver/small_gpio.d \
./drivers/rs485/driver/ssp.d \
./drivers/rs485/driver/timer16.d \
./drivers/rs485/driver/timer32.d \
./drivers/rs485/driver/uart.d \
./drivers/rs485/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/rs485/driver/%.o: ../drivers/rs485/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


