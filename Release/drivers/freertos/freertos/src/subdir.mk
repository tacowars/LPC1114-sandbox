################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/freertos/freertos/src/croutine.c \
../drivers/freertos/freertos/src/list.c \
../drivers/freertos/freertos/src/queue.c \
../drivers/freertos/freertos/src/tasks.c 

OBJS += \
./drivers/freertos/freertos/src/croutine.o \
./drivers/freertos/freertos/src/list.o \
./drivers/freertos/freertos/src/queue.o \
./drivers/freertos/freertos/src/tasks.o 

C_DEPS += \
./drivers/freertos/freertos/src/croutine.d \
./drivers/freertos/freertos/src/list.d \
./drivers/freertos/freertos/src/queue.d \
./drivers/freertos/freertos/src/tasks.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/freertos/freertos/src/%.o: ../drivers/freertos/freertos/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


