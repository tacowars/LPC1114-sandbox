################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/common/driver/adc.c \
../drivers/common/driver/can.c \
../drivers/common/driver/clkconfig.c \
../drivers/common/driver/crp.c \
../drivers/common/driver/debug_printf.c \
../drivers/common/driver/gpio.c \
../drivers/common/driver/i2c.c \
../drivers/common/driver/i2cslave.c \
../drivers/common/driver/lpc_swu.c \
../drivers/common/driver/rs485.c \
../drivers/common/driver/small_gpio.c \
../drivers/common/driver/ssp.c \
../drivers/common/driver/timer16.c \
../drivers/common/driver/timer32.c \
../drivers/common/driver/uart.c \
../drivers/common/driver/wdt.c 

OBJS += \
./drivers/common/driver/adc.o \
./drivers/common/driver/can.o \
./drivers/common/driver/clkconfig.o \
./drivers/common/driver/crp.o \
./drivers/common/driver/debug_printf.o \
./drivers/common/driver/gpio.o \
./drivers/common/driver/i2c.o \
./drivers/common/driver/i2cslave.o \
./drivers/common/driver/lpc_swu.o \
./drivers/common/driver/rs485.o \
./drivers/common/driver/small_gpio.o \
./drivers/common/driver/ssp.o \
./drivers/common/driver/timer16.o \
./drivers/common/driver/timer32.o \
./drivers/common/driver/uart.o \
./drivers/common/driver/wdt.o 

C_DEPS += \
./drivers/common/driver/adc.d \
./drivers/common/driver/can.d \
./drivers/common/driver/clkconfig.d \
./drivers/common/driver/crp.d \
./drivers/common/driver/debug_printf.d \
./drivers/common/driver/gpio.d \
./drivers/common/driver/i2c.d \
./drivers/common/driver/i2cslave.d \
./drivers/common/driver/lpc_swu.d \
./drivers/common/driver/rs485.d \
./drivers/common/driver/small_gpio.d \
./drivers/common/driver/ssp.d \
./drivers/common/driver/timer16.d \
./drivers/common/driver/timer32.d \
./drivers/common/driver/uart.d \
./drivers/common/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/common/driver/%.o: ../drivers/common/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


