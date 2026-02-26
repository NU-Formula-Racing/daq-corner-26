################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/AVR32_UC3/port.c 

S_UPPER_SRCS += \
../freertos/portable/GCC/AVR32_UC3/exception.S 

OBJS += \
./freertos/portable/GCC/AVR32_UC3/exception.o \
./freertos/portable/GCC/AVR32_UC3/port.o 

S_UPPER_DEPS += \
./freertos/portable/GCC/AVR32_UC3/exception.d 

C_DEPS += \
./freertos/portable/GCC/AVR32_UC3/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/AVR32_UC3/%.o: ../freertos/portable/GCC/AVR32_UC3/%.S freertos/portable/GCC/AVR32_UC3/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
freertos/portable/GCC/AVR32_UC3/%.o freertos/portable/GCC/AVR32_UC3/%.su freertos/portable/GCC/AVR32_UC3/%.cyclo: ../freertos/portable/GCC/AVR32_UC3/%.c freertos/portable/GCC/AVR32_UC3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-AVR32_UC3

clean-freertos-2f-portable-2f-GCC-2f-AVR32_UC3:
	-$(RM) ./freertos/portable/GCC/AVR32_UC3/exception.d ./freertos/portable/GCC/AVR32_UC3/exception.o ./freertos/portable/GCC/AVR32_UC3/port.cyclo ./freertos/portable/GCC/AVR32_UC3/port.d ./freertos/portable/GCC/AVR32_UC3/port.o ./freertos/portable/GCC/AVR32_UC3/port.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-AVR32_UC3

