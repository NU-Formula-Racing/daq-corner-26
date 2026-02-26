################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/BCC/16BitDOS/Flsh186/port.c 

OBJS += \
./freertos/portable/BCC/16BitDOS/Flsh186/port.o 

C_DEPS += \
./freertos/portable/BCC/16BitDOS/Flsh186/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/BCC/16BitDOS/Flsh186/%.o freertos/portable/BCC/16BitDOS/Flsh186/%.su freertos/portable/BCC/16BitDOS/Flsh186/%.cyclo: ../freertos/portable/BCC/16BitDOS/Flsh186/%.c freertos/portable/BCC/16BitDOS/Flsh186/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-BCC-2f-16BitDOS-2f-Flsh186

clean-freertos-2f-portable-2f-BCC-2f-16BitDOS-2f-Flsh186:
	-$(RM) ./freertos/portable/BCC/16BitDOS/Flsh186/port.cyclo ./freertos/portable/BCC/16BitDOS/Flsh186/port.d ./freertos/portable/BCC/16BitDOS/Flsh186/port.o ./freertos/portable/BCC/16BitDOS/Flsh186/port.su

.PHONY: clean-freertos-2f-portable-2f-BCC-2f-16BitDOS-2f-Flsh186

