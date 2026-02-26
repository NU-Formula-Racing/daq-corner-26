################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/IA32_flat/port.c 

S_UPPER_SRCS += \
../freertos/portable/GCC/IA32_flat/portASM.S 

OBJS += \
./freertos/portable/GCC/IA32_flat/port.o \
./freertos/portable/GCC/IA32_flat/portASM.o 

S_UPPER_DEPS += \
./freertos/portable/GCC/IA32_flat/portASM.d 

C_DEPS += \
./freertos/portable/GCC/IA32_flat/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/IA32_flat/%.o freertos/portable/GCC/IA32_flat/%.su freertos/portable/GCC/IA32_flat/%.cyclo: ../freertos/portable/GCC/IA32_flat/%.c freertos/portable/GCC/IA32_flat/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/GCC/IA32_flat/%.o: ../freertos/portable/GCC/IA32_flat/%.S freertos/portable/GCC/IA32_flat/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-GCC-2f-IA32_flat

clean-freertos-2f-portable-2f-GCC-2f-IA32_flat:
	-$(RM) ./freertos/portable/GCC/IA32_flat/port.cyclo ./freertos/portable/GCC/IA32_flat/port.d ./freertos/portable/GCC/IA32_flat/port.o ./freertos/portable/GCC/IA32_flat/port.su ./freertos/portable/GCC/IA32_flat/portASM.d ./freertos/portable/GCC/IA32_flat/portASM.o

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-IA32_flat

