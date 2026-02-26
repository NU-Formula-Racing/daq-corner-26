################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/ThirdParty/GCC/ARC_v1/arc_support.s 

C_SRCS += \
../freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.c \
../freertos/portable/ThirdParty/GCC/ARC_v1/port.c 

OBJS += \
./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.o \
./freertos/portable/ThirdParty/GCC/ARC_v1/arc_support.o \
./freertos/portable/ThirdParty/GCC/ARC_v1/port.o 

S_DEPS += \
./freertos/portable/ThirdParty/GCC/ARC_v1/arc_support.d 

C_DEPS += \
./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.d \
./freertos/portable/ThirdParty/GCC/ARC_v1/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ThirdParty/GCC/ARC_v1/%.o freertos/portable/ThirdParty/GCC/ARC_v1/%.su freertos/portable/ThirdParty/GCC/ARC_v1/%.cyclo: ../freertos/portable/ThirdParty/GCC/ARC_v1/%.c freertos/portable/ThirdParty/GCC/ARC_v1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/ThirdParty/GCC/ARC_v1/%.o: ../freertos/portable/ThirdParty/GCC/ARC_v1/%.s freertos/portable/ThirdParty/GCC/ARC_v1/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1

clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1:
	-$(RM) ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.cyclo ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.d ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.o ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.su ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_support.d ./freertos/portable/ThirdParty/GCC/ARC_v1/arc_support.o ./freertos/portable/ThirdParty/GCC/ARC_v1/port.cyclo ./freertos/portable/ThirdParty/GCC/ARC_v1/port.d ./freertos/portable/ThirdParty/GCC/ARC_v1/port.o ./freertos/portable/ThirdParty/GCC/ARC_v1/port.su

.PHONY: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1

