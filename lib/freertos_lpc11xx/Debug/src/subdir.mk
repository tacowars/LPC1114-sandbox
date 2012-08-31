################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc11.c \
../src/debug.c \
../src/main.c \
../src/small_gpio.c 

OBJS += \
./src/cr_startup_lpc11.o \
./src/debug.o \
./src/main.o \
./src/small_gpio.o 

C_DEPS += \
./src/cr_startup_lpc11.d \
./src/debug.d \
./src/main.d \
./src/small_gpio.d 


# Each subdirectory must supply rules for building sources it contributes
src/cr_startup_lpc11.o: ../src/cr_startup_lpc11.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__USE_CMSIS=CMSISv1p30_LPC11xx -DDEBUG -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\CMSISv1p30_LPC11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\lib_small_printf_m0\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\port\lpcxpresso\m0" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\inc" -O2 -Os -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -D__REDLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/cr_startup_lpc11.d" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/debug.o: ../src/debug.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__USE_CMSIS=CMSISv1p30_LPC11xx -DDEBUG -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\CMSISv1p30_LPC11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\lib_small_printf_m0\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\port\lpcxpresso\m0" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\inc" -O2 -Os -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -D__REDLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/debug.d" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__USE_CMSIS=CMSISv1p30_LPC11xx -DDEBUG -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\CMSISv1p30_LPC11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\lib_small_printf_m0\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\port\lpcxpresso\m0" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\inc" -I"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\freertos_lpc11xx\freertos\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -D__REDLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


