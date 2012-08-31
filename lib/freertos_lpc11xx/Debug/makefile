################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src/subdir.mk
-include freertos/src/subdir.mk
-include freertos/port/memmang/subdir.mk
-include freertos/port/lpcxpresso/m0/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: freertos_111x.axf

# Tool invocations
freertos_111x.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\CMSISv1p30_LPC11xx\Debug" -L"C:\Documents and Settings\nxp21346\Desktop\LPCXpresso_Fix_Examples\LPCE\lib_small_printf_m0\Lib" -Xlinker -Map=freertos_111x.map -Xlinker --gc-sections -mcpu=cortex-m0 -mthumb -T "freertos_111x_Debug.ld" -o"freertos_111x.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) freertos_111x.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-cat ../abstract.txt; arm-none-eabi-size freertos_111x.axf; arm-none-eabi-objcopy -O binary freertos_111x.axf freertos_111x.bin ; checksum -d freertos_111x.bin;
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
