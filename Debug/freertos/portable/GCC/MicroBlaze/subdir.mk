################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/GCC/MicroBlaze/portasm.s 

C_SRCS += \
../freertos/portable/GCC/MicroBlaze/port.c 

OBJS += \
./freertos/portable/GCC/MicroBlaze/port.o \
./freertos/portable/GCC/MicroBlaze/portasm.o 

S_DEPS += \
./freertos/portable/GCC/MicroBlaze/portasm.d 

C_DEPS += \
./freertos/portable/GCC/MicroBlaze/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/MicroBlaze/%.o freertos/portable/GCC/MicroBlaze/%.su freertos/portable/GCC/MicroBlaze/%.cyclo: ../freertos/portable/GCC/MicroBlaze/%.c freertos/portable/GCC/MicroBlaze/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/GCC/MicroBlaze/%.o: ../freertos/portable/GCC/MicroBlaze/%.s freertos/portable/GCC/MicroBlaze/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-GCC-2f-MicroBlaze

clean-freertos-2f-portable-2f-GCC-2f-MicroBlaze:
	-$(RM) ./freertos/portable/GCC/MicroBlaze/port.cyclo ./freertos/portable/GCC/MicroBlaze/port.d ./freertos/portable/GCC/MicroBlaze/port.o ./freertos/portable/GCC/MicroBlaze/port.su ./freertos/portable/GCC/MicroBlaze/portasm.d ./freertos/portable/GCC/MicroBlaze/portasm.o

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-MicroBlaze

