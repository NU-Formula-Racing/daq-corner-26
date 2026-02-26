################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/Renesas/RX600/port.c 

OBJS += \
./freertos/portable/Renesas/RX600/port.o 

C_DEPS += \
./freertos/portable/Renesas/RX600/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/Renesas/RX600/%.o freertos/portable/Renesas/RX600/%.su freertos/portable/Renesas/RX600/%.cyclo: ../freertos/portable/Renesas/RX600/%.c freertos/portable/Renesas/RX600/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-Renesas-2f-RX600

clean-freertos-2f-portable-2f-Renesas-2f-RX600:
	-$(RM) ./freertos/portable/Renesas/RX600/port.cyclo ./freertos/portable/Renesas/RX600/port.d ./freertos/portable/Renesas/RX600/port.o ./freertos/portable/Renesas/RX600/port.su

.PHONY: clean-freertos-2f-portable-2f-Renesas-2f-RX600

