################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/systick/driver/adc.c \
../drivers/systick/driver/can.c \
../drivers/systick/driver/clkconfig.c \
../drivers/systick/driver/crp.c \
../drivers/systick/driver/debug_printf.c \
../drivers/systick/driver/gpio.c \
../drivers/systick/driver/i2c.c \
../drivers/systick/driver/i2cslave.c \
../drivers/systick/driver/lpc_swu.c \
../drivers/systick/driver/rs485.c \
../drivers/systick/driver/small_gpio.c \
../drivers/systick/driver/ssp.c \
../drivers/systick/driver/timer16.c \
../drivers/systick/driver/timer32.c \
../drivers/systick/driver/uart.c \
../drivers/systick/driver/wdt.c 

OBJS += \
./drivers/systick/driver/adc.o \
./drivers/systick/driver/can.o \
./drivers/systick/driver/clkconfig.o \
./drivers/systick/driver/crp.o \
./drivers/systick/driver/debug_printf.o \
./drivers/systick/driver/gpio.o \
./drivers/systick/driver/i2c.o \
./drivers/systick/driver/i2cslave.o \
./drivers/systick/driver/lpc_swu.o \
./drivers/systick/driver/rs485.o \
./drivers/systick/driver/small_gpio.o \
./drivers/systick/driver/ssp.o \
./drivers/systick/driver/timer16.o \
./drivers/systick/driver/timer32.o \
./drivers/systick/driver/uart.o \
./drivers/systick/driver/wdt.o 

C_DEPS += \
./drivers/systick/driver/adc.d \
./drivers/systick/driver/can.d \
./drivers/systick/driver/clkconfig.d \
./drivers/systick/driver/crp.d \
./drivers/systick/driver/debug_printf.d \
./drivers/systick/driver/gpio.d \
./drivers/systick/driver/i2c.d \
./drivers/systick/driver/i2cslave.d \
./drivers/systick/driver/lpc_swu.d \
./drivers/systick/driver/rs485.d \
./drivers/systick/driver/small_gpio.d \
./drivers/systick/driver/ssp.d \
./drivers/systick/driver/timer16.d \
./drivers/systick/driver/timer32.d \
./drivers/systick/driver/uart.d \
./drivers/systick/driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/systick/driver/%.o: ../drivers/systick/driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


