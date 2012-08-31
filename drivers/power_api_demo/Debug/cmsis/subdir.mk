################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cmsis/core_cm0.c \
../cmsis/system_LPC11xx.c 

OBJS += \
./cmsis/core_cm0.o \
./cmsis/system_LPC11xx.o 

C_DEPS += \
./cmsis/core_cm0.d \
./cmsis/system_LPC11xx.d 


# Each subdirectory must supply rules for building sources it contributes
cmsis/%.o: ../cmsis/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -DTARGET_SHORTCHIP=lpc11 -DTARGET_CHIP=LPC1114/302 -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\cmsis" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\config" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\startup" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\driver" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


