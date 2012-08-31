################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/adc.c \
../driver/can.c \
../driver/clkconfig.c \
../driver/crp.c \
../driver/debug_printf.c \
../driver/gpio.c \
../driver/i2c.c \
../driver/i2cslave.c \
../driver/lpc_swu.c \
../driver/rs485.c \
../driver/small_gpio.c \
../driver/ssp.c \
../driver/timer16.c \
../driver/timer32.c \
../driver/uart.c \
../driver/wdt.c 

OBJS += \
./driver/adc.o \
./driver/can.o \
./driver/clkconfig.o \
./driver/crp.o \
./driver/debug_printf.o \
./driver/gpio.o \
./driver/i2c.o \
./driver/i2cslave.o \
./driver/lpc_swu.o \
./driver/rs485.o \
./driver/small_gpio.o \
./driver/ssp.o \
./driver/timer16.o \
./driver/timer32.o \
./driver/uart.o \
./driver/wdt.o 

C_DEPS += \
./driver/adc.d \
./driver/can.d \
./driver/clkconfig.d \
./driver/crp.d \
./driver/debug_printf.d \
./driver/gpio.d \
./driver/i2c.d \
./driver/i2cslave.d \
./driver/lpc_swu.d \
./driver/rs485.d \
./driver/small_gpio.d \
./driver/ssp.d \
./driver/timer16.d \
./driver/timer32.d \
./driver/uart.d \
./driver/wdt.d 


# Each subdirectory must supply rules for building sources it contributes
driver/%.o: ../driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -D__USE_CMSIS -DDEBUG -D__CODE_RED -I../cmsis -I../config -I../driver -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


