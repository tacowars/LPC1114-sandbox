################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/lib_small_printf_m0/src/small_printf_float.c \
../drivers/lib_small_printf_m0/src/small_printf_nofloat.c \
../drivers/lib_small_printf_m0/src/small_printf_support.c \
../drivers/lib_small_printf_m0/src/small_utils.c 

OBJS += \
./drivers/lib_small_printf_m0/src/small_printf_float.o \
./drivers/lib_small_printf_m0/src/small_printf_nofloat.o \
./drivers/lib_small_printf_m0/src/small_printf_support.o \
./drivers/lib_small_printf_m0/src/small_utils.o 

C_DEPS += \
./drivers/lib_small_printf_m0/src/small_printf_float.d \
./drivers/lib_small_printf_m0/src/small_printf_nofloat.d \
./drivers/lib_small_printf_m0/src/small_printf_support.d \
./drivers/lib_small_printf_m0/src/small_utils.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/lib_small_printf_m0/src/%.o: ../drivers/lib_small_printf_m0/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DNDEBUG -D__CODE_RED -D__USE_CMSIS=CMSISv2p00_LPC11xx -I"/Users/patrick/Documents/workspace_expresso/hello/drivers" -I"/Users/patrick/Documents/workspace_expresso/CMSISv2p00_LPC11xx/inc" -Os -g -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


