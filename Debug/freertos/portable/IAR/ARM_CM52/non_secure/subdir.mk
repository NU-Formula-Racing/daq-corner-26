################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/IAR/ARM_CM52/non_secure/portasm.s 

C_SRCS += \
../freertos/portable/IAR/ARM_CM52/non_secure/port.c 

S_UPPER_SRCS += \
../freertos/portable/IAR/ARM_CM52/non_secure/mpu_wrappers_v2_asm.S 

OBJS += \
./freertos/portable/IAR/ARM_CM52/non_secure/mpu_wrappers_v2_asm.o \
./freertos/portable/IAR/ARM_CM52/non_secure/port.o \
./freertos/portable/IAR/ARM_CM52/non_secure/portasm.o 

S_DEPS += \
./freertos/portable/IAR/ARM_CM52/non_secure/portasm.d 

S_UPPER_DEPS += \
./freertos/portable/IAR/ARM_CM52/non_secure/mpu_wrappers_v2_asm.d 

C_DEPS += \
./freertos/portable/IAR/ARM_CM52/non_secure/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/ARM_CM52/non_secure/%.o: ../freertos/portable/IAR/ARM_CM52/non_secure/%.S freertos/portable/IAR/ARM_CM52/non_secure/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
freertos/portable/IAR/ARM_CM52/non_secure/%.o freertos/portable/IAR/ARM_CM52/non_secure/%.su freertos/portable/IAR/ARM_CM52/non_secure/%.cyclo: ../freertos/portable/IAR/ARM_CM52/non_secure/%.c freertos/portable/IAR/ARM_CM52/non_secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/IAR/ARM_CM52/non_secure/%.o: ../freertos/portable/IAR/ARM_CM52/non_secure/%.s freertos/portable/IAR/ARM_CM52/non_secure/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-IAR-2f-ARM_CM52-2f-non_secure

clean-freertos-2f-portable-2f-IAR-2f-ARM_CM52-2f-non_secure:
	-$(RM) ./freertos/portable/IAR/ARM_CM52/non_secure/mpu_wrappers_v2_asm.d ./freertos/portable/IAR/ARM_CM52/non_secure/mpu_wrappers_v2_asm.o ./freertos/portable/IAR/ARM_CM52/non_secure/port.cyclo ./freertos/portable/IAR/ARM_CM52/non_secure/port.d ./freertos/portable/IAR/ARM_CM52/non_secure/port.o ./freertos/portable/IAR/ARM_CM52/non_secure/port.su ./freertos/portable/IAR/ARM_CM52/non_secure/portasm.d ./freertos/portable/IAR/ARM_CM52/non_secure/portasm.o

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-ARM_CM52-2f-non_secure

