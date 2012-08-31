################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/port/lpcxpresso/m0/port.c 

OBJS += \
./freertos/port/lpcxpresso/m0/port.o 

C_DEPS += \
./freertos/port/lpcxpresso/m0/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/port/lpcxpresso/m0/%.o: ../freertos/port/lpcxpresso/m0/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -D__USE_CMSIS -DDEBUG -D__CODE_RED -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\freertos\freertos\inc" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\lib_small_printf_m0\inc" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\freertos\cmsis" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\freertos\freertos\port\lpcxpresso\m0" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\freertos\config" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\freertos\driver" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


