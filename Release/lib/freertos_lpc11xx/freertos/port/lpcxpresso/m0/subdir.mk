################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/freertos_lpc11xx/freertos/port/lpcxpresso/m0/port.c 

OBJS += \
./lib/freertos_lpc11xx/freertos/port/lpcxpresso/m0/port.o 

C_DEPS += \
./lib/freertos_lpc11xx/freertos/port/lpcxpresso/m0/port.d 


# Each subdirectory must supply rules for building sources it contributes
lib/freertos_lpc11xx/freertos/port/lpcxpresso/m0/%.o: ../lib/freertos_lpc11xx/freertos/port/lpcxpresso/m0/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


