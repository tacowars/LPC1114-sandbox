################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/blinky/driver/adc.c \
../drivers/blinky/driver/can.c \
../drivers/blinky/driver/clkconfig.c \
../drivers/blinky/driver/crp.c \
../drivers/blinky/driver/debug_printf.c \
../drivers/blinky/driver/gpio.c \
../drivers/blinky/driver/i2c.c \
../drivers/blinky/driver/i2cslave.c \
../drivers/blinky/driver/lpc_swu.c \
../drivers/blinky/driver/rs485.c \
../drivers/blinky/driver/small_gpio.c \
../drivers/blinky/driver/ssp.c \
../drivers/blinky/driver/timer16.c \
../drivers/blinky/driver/timer32.c \
../drivers/blinky/driver/uart.c \
../drivers/blinky/driver/wdt.c 

OBJS += \
./drivers/blinky/driver/adc.o \
./drivers/blinky/driver/can.o \
./drivers/blinky/driver/clkconfig.o \
./drivers/blinky/driver/crp.o \
./drivers/blinky/driver/debug_printf.o \
./drivers/blinky/driver/gpio.o \
./drivers/blinky/driver/i2c.o \
./drivers/blinky/driver/i2cslave.o \
./drivers/blinky/driver/lpc_swu.o \
./drivers/blinky/driver/rs485.o \
./drivers/blinky/driver/small_gpio.o \
./drivers/blinky/driver/ssp.o \
./drivers/blinky/driver/timer16.o \
./drivers/blinky/driver/timer32.o \
./drivers/blinky/driver/uart.o \
./drivers/blinky/driver/wdt.o 

C_DEPS += \
./drivers/blinky/driver/adc.d \
./drivers/blinky/driver/can.d \
./drivers/blinky/driver/clkconfig.d \
./drivers/blinky/driver/crp.d \
./drivers/blinky/driver/debug_printf.d \
./drivers/blinky/driver/gpio.d \
./drivers/blinky/driver/i2c.d \
./drivers/blinky/driver/i2cslave.d \
./drivers/blinky/driver/lpc_swu.d \
./drivers/blinky/driver/rs485.d \
./drivers/blinky/driver/small_gpio.d \
./drivers/blinky/driver/ssp.d \
./drivers/blinky/driver/timer16.d \
./drivers/blinky/driver/timer32.d \
./drivers/blinky/driver/uart.d \
./drivers/blinky/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/blinky/driver/%.o: ../drivers/blinky/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


