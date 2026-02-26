################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/portasm.s 

S_UPPER_SRCS += \
../freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/mpu_wrappers_v2_asm.S 

OBJS += \
./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/mpu_wrappers_v2_asm.o \
./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/portasm.o 

S_DEPS += \
./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/portasm.d 

S_UPPER_DEPS += \
./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/mpu_wrappers_v2_asm.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/%.o: ../freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/%.S freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/%.o: ../freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/%.s freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33_NTZ

clean-freertos-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33_NTZ:
	-$(RM) ./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/mpu_wrappers_v2_asm.d ./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/mpu_wrappers_v2_asm.o ./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/portasm.d ./freertos/portable/ARMv8M/non_secure/portable/IAR/ARM_CM33_NTZ/portasm.o

.PHONY: clean-freertos-2f-portable-2f-ARMv8M-2f-non_secure-2f-portable-2f-IAR-2f-ARM_CM33_NTZ

