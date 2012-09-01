################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/ssp/driver/adc.c \
../drivers/ssp/driver/can.c \
../drivers/ssp/driver/clkconfig.c \
../drivers/ssp/driver/crp.c \
../drivers/ssp/driver/debug_printf.c \
../drivers/ssp/driver/gpio.c \
../drivers/ssp/driver/i2c.c \
../drivers/ssp/driver/i2cslave.c \
../drivers/ssp/driver/lpc_swu.c \
../drivers/ssp/driver/rs485.c \
../drivers/ssp/driver/small_gpio.c \
../drivers/ssp/driver/ssp.c \
../drivers/ssp/driver/timer16.c \
../drivers/ssp/driver/timer32.c \
../drivers/ssp/driver/uart.c \
../drivers/ssp/driver/wdt.c 

OBJS += \
./drivers/ssp/driver/adc.o \
./drivers/ssp/driver/can.o \
./drivers/ssp/driver/clkconfig.o \
./drivers/ssp/driver/crp.o \
./drivers/ssp/driver/debug_printf.o \
./drivers/ssp/driver/gpio.o \
./drivers/ssp/driver/i2c.o \
./drivers/ssp/driver/i2cslave.o \
./drivers/ssp/driver/lpc_swu.o \
./drivers/ssp/driver/rs485.o \
./drivers/ssp/driver/small_gpio.o \
./drivers/ssp/driver/ssp.o \
./drivers/ssp/driver/timer16.o \
./drivers/ssp/driver/timer32.o \
./drivers/ssp/driver/uart.o \
./drivers/ssp/driver/wdt.o 

C_DEPS += \
./drivers/ssp/driver/adc.d \
./drivers/ssp/driver/can.d \
./drivers/ssp/driver/clkconfig.d \
./drivers/ssp/driver/crp.d \
./drivers/ssp/driver/debug_printf.d \
./drivers/ssp/driver/gpio.d \
./drivers/ssp/driver/i2c.d \
./drivers/ssp/driver/i2cslave.d \
./drivers/ssp/driver/lpc_swu.d \
./drivers/ssp/driver/rs485.d \
./drivers/ssp/driver/small_gpio.d \
./drivers/ssp/driver/ssp.d \
./drivers/ssp/driver/timer16.d \
./drivers/ssp/driver/timer32.d \
./drivers/ssp/driver/uart.d \
./drivers/ssp/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/ssp/driver/%.o: ../drivers/ssp/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


