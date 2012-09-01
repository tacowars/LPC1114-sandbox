################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/invokeisp/driver/adc.c \
../drivers/invokeisp/driver/can.c \
../drivers/invokeisp/driver/clkconfig.c \
../drivers/invokeisp/driver/crp.c \
../drivers/invokeisp/driver/debug_printf.c \
../drivers/invokeisp/driver/gpio.c \
../drivers/invokeisp/driver/i2c.c \
../drivers/invokeisp/driver/i2cslave.c \
../drivers/invokeisp/driver/lpc_swu.c \
../drivers/invokeisp/driver/rs485.c \
../drivers/invokeisp/driver/small_gpio.c \
../drivers/invokeisp/driver/ssp.c \
../drivers/invokeisp/driver/timer16.c \
../drivers/invokeisp/driver/timer32.c \
../drivers/invokeisp/driver/uart.c \
../drivers/invokeisp/driver/wdt.c 

OBJS += \
./drivers/invokeisp/driver/adc.o \
./drivers/invokeisp/driver/can.o \
./drivers/invokeisp/driver/clkconfig.o \
./drivers/invokeisp/driver/crp.o \
./drivers/invokeisp/driver/debug_printf.o \
./drivers/invokeisp/driver/gpio.o \
./drivers/invokeisp/driver/i2c.o \
./drivers/invokeisp/driver/i2cslave.o \
./drivers/invokeisp/driver/lpc_swu.o \
./drivers/invokeisp/driver/rs485.o \
./drivers/invokeisp/driver/small_gpio.o \
./drivers/invokeisp/driver/ssp.o \
./drivers/invokeisp/driver/timer16.o \
./drivers/invokeisp/driver/timer32.o \
./drivers/invokeisp/driver/uart.o \
./drivers/invokeisp/driver/wdt.o 

C_DEPS += \
./drivers/invokeisp/driver/adc.d \
./drivers/invokeisp/driver/can.d \
./drivers/invokeisp/driver/clkconfig.d \
./drivers/invokeisp/driver/crp.d \
./drivers/invokeisp/driver/debug_printf.d \
./drivers/invokeisp/driver/gpio.d \
./drivers/invokeisp/driver/i2c.d \
./drivers/invokeisp/driver/i2cslave.d \
./drivers/invokeisp/driver/lpc_swu.d \
./drivers/invokeisp/driver/rs485.d \
./drivers/invokeisp/driver/small_gpio.d \
./drivers/invokeisp/driver/ssp.d \
./drivers/invokeisp/driver/timer16.d \
./drivers/invokeisp/driver/timer32.d \
./drivers/invokeisp/driver/uart.d \
./drivers/invokeisp/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/invokeisp/driver/%.o: ../drivers/invokeisp/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


