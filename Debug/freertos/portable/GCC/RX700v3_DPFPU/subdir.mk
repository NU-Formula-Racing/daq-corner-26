################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/RX700v3_DPFPU/port.c 

OBJS += \
./freertos/portable/GCC/RX700v3_DPFPU/port.o 

C_DEPS += \
./freertos/portable/GCC/RX700v3_DPFPU/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/RX700v3_DPFPU/%.o freertos/portable/GCC/RX700v3_DPFPU/%.su freertos/portable/GCC/RX700v3_DPFPU/%.cyclo: ../freertos/portable/GCC/RX700v3_DPFPU/%.c freertos/portable/GCC/RX700v3_DPFPU/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-RX700v3_DPFPU

clean-freertos-2f-portable-2f-GCC-2f-RX700v3_DPFPU:
	-$(RM) ./freertos/portable/GCC/RX700v3_DPFPU/port.cyclo ./freertos/portable/GCC/RX700v3_DPFPU/port.d ./freertos/portable/GCC/RX700v3_DPFPU/port.o ./freertos/portable/GCC/RX700v3_DPFPU/port.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-RX700v3_DPFPU

