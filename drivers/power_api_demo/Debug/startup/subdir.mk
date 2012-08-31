################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/cr_startup_lpc11.c 

OBJS += \
./startup/cr_startup_lpc11.o 

C_DEPS += \
./startup/cr_startup_lpc11.d 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -DTARGET_SHORTCHIP=lpc11 -DTARGET_CHIP=LPC1114/302 -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\cmsis" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\config" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\startup" -I"D:\projects\lpcxpresso\samples\2011-01-26-lpc11xx\power_api_demo\driver" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


