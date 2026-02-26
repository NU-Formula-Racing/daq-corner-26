################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.c 

OBJS += \
./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o 

C_DEPS += \
./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ThirdParty/GCC/ARM_TFM/%.o freertos/portable/ThirdParty/GCC/ARM_TFM/%.su freertos/portable/ThirdParty/GCC/ARM_TFM/%.cyclo: ../freertos/portable/ThirdParty/GCC/ARM_TFM/%.c freertos/portable/ThirdParty/GCC/ARM_TFM/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM:
	-$(RM) ./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.cyclo ./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d ./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o ./freertos/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.su

.PHONY: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

