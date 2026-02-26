################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/CCS/ARM_Cortex-R4/port.c 

OBJS += \
./freertos/portable/CCS/ARM_Cortex-R4/port.o 

C_DEPS += \
./freertos/portable/CCS/ARM_Cortex-R4/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/CCS/ARM_Cortex-R4/%.o freertos/portable/CCS/ARM_Cortex-R4/%.su freertos/portable/CCS/ARM_Cortex-R4/%.cyclo: ../freertos/portable/CCS/ARM_Cortex-R4/%.c freertos/portable/CCS/ARM_Cortex-R4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4

clean-freertos-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4:
	-$(RM) ./freertos/portable/CCS/ARM_Cortex-R4/port.cyclo ./freertos/portable/CCS/ARM_Cortex-R4/port.d ./freertos/portable/CCS/ARM_Cortex-R4/port.o ./freertos/portable/CCS/ARM_Cortex-R4/port.su

.PHONY: clean-freertos-2f-portable-2f-CCS-2f-ARM_Cortex-2d-R4

