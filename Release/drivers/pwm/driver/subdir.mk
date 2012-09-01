################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/pwm/driver/adc.c \
../drivers/pwm/driver/can.c \
../drivers/pwm/driver/clkconfig.c \
../drivers/pwm/driver/crp.c \
../drivers/pwm/driver/debug_printf.c \
../drivers/pwm/driver/gpio.c \
../drivers/pwm/driver/i2c.c \
../drivers/pwm/driver/i2cslave.c \
../drivers/pwm/driver/lpc_swu.c \
../drivers/pwm/driver/rs485.c \
../drivers/pwm/driver/small_gpio.c \
../drivers/pwm/driver/ssp.c \
../drivers/pwm/driver/timer16.c \
../drivers/pwm/driver/timer32.c \
../drivers/pwm/driver/uart.c \
../drivers/pwm/driver/wdt.c 

OBJS += \
./drivers/pwm/driver/adc.o \
./drivers/pwm/driver/can.o \
./drivers/pwm/driver/clkconfig.o \
./drivers/pwm/driver/crp.o \
./drivers/pwm/driver/debug_printf.o \
./drivers/pwm/driver/gpio.o \
./drivers/pwm/driver/i2c.o \
./drivers/pwm/driver/i2cslave.o \
./drivers/pwm/driver/lpc_swu.o \
./drivers/pwm/driver/rs485.o \
./drivers/pwm/driver/small_gpio.o \
./drivers/pwm/driver/ssp.o \
./drivers/pwm/driver/timer16.o \
./drivers/pwm/driver/timer32.o \
./drivers/pwm/driver/uart.o \
./drivers/pwm/driver/wdt.o 

C_DEPS += \
./drivers/pwm/driver/adc.d \
./drivers/pwm/driver/can.d \
./drivers/pwm/driver/clkconfig.d \
./drivers/pwm/driver/crp.d \
./drivers/pwm/driver/debug_printf.d \
./drivers/pwm/driver/gpio.d \
./drivers/pwm/driver/i2c.d \
./drivers/pwm/driver/i2cslave.d \
./drivers/pwm/driver/lpc_swu.d \
./drivers/pwm/driver/rs485.d \
./drivers/pwm/driver/small_gpio.d \
./drivers/pwm/driver/ssp.d \
./drivers/pwm/driver/timer16.d \
./drivers/pwm/driver/timer32.d \
./drivers/pwm/driver/uart.d \
./drivers/pwm/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/pwm/driver/%.o: ../drivers/pwm/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


