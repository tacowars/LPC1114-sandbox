################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/power_api_demo/driver/adc.c \
../drivers/power_api_demo/driver/can.c \
../drivers/power_api_demo/driver/clkconfig.c \
../drivers/power_api_demo/driver/crp.c \
../drivers/power_api_demo/driver/debug_printf.c \
../drivers/power_api_demo/driver/gpio.c \
../drivers/power_api_demo/driver/i2c.c \
../drivers/power_api_demo/driver/i2cslave.c \
../drivers/power_api_demo/driver/lpc_swu.c \
../drivers/power_api_demo/driver/rs485.c \
../drivers/power_api_demo/driver/small_gpio.c \
../drivers/power_api_demo/driver/ssp.c \
../drivers/power_api_demo/driver/timer16.c \
../drivers/power_api_demo/driver/timer32.c \
../drivers/power_api_demo/driver/uart.c \
../drivers/power_api_demo/driver/wdt.c 

OBJS += \
./drivers/power_api_demo/driver/adc.o \
./drivers/power_api_demo/driver/can.o \
./drivers/power_api_demo/driver/clkconfig.o \
./drivers/power_api_demo/driver/crp.o \
./drivers/power_api_demo/driver/debug_printf.o \
./drivers/power_api_demo/driver/gpio.o \
./drivers/power_api_demo/driver/i2c.o \
./drivers/power_api_demo/driver/i2cslave.o \
./drivers/power_api_demo/driver/lpc_swu.o \
./drivers/power_api_demo/driver/rs485.o \
./drivers/power_api_demo/driver/small_gpio.o \
./drivers/power_api_demo/driver/ssp.o \
./drivers/power_api_demo/driver/timer16.o \
./drivers/power_api_demo/driver/timer32.o \
./drivers/power_api_demo/driver/uart.o \
./drivers/power_api_demo/driver/wdt.o 

C_DEPS += \
./drivers/power_api_demo/driver/adc.d \
./drivers/power_api_demo/driver/can.d \
./drivers/power_api_demo/driver/clkconfig.d \
./drivers/power_api_demo/driver/crp.d \
./drivers/power_api_demo/driver/debug_printf.d \
./drivers/power_api_demo/driver/gpio.d \
./drivers/power_api_demo/driver/i2c.d \
./drivers/power_api_demo/driver/i2cslave.d \
./drivers/power_api_demo/driver/lpc_swu.d \
./drivers/power_api_demo/driver/rs485.d \
./drivers/power_api_demo/driver/small_gpio.d \
./drivers/power_api_demo/driver/ssp.d \
./drivers/power_api_demo/driver/timer16.d \
./drivers/power_api_demo/driver/timer32.d \
./drivers/power_api_demo/driver/uart.d \
./drivers/power_api_demo/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/power_api_demo/driver/%.o: ../drivers/power_api_demo/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


