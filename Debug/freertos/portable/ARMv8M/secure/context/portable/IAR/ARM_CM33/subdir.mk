################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.s 

OBJS += \
./freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.o 

S_DEPS += \
./freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/%.o: ../freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/%.s freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33

clean-freertos-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33:
	-$(RM) ./freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.d ./freertos/portable/ARMv8M/secure/context/portable/IAR/ARM_CM33/secure_context_port_asm.o

.PHONY: clean-freertos-2f-portable-2f-ARMv8M-2f-secure-2f-context-2f-portable-2f-IAR-2f-ARM_CM33

