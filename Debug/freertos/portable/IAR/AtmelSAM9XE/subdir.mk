################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/IAR/AtmelSAM9XE/port.c 

OBJS += \
./freertos/portable/IAR/AtmelSAM9XE/port.o 

C_DEPS += \
./freertos/portable/IAR/AtmelSAM9XE/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/AtmelSAM9XE/%.o freertos/portable/IAR/AtmelSAM9XE/%.su freertos/portable/IAR/AtmelSAM9XE/%.cyclo: ../freertos/portable/IAR/AtmelSAM9XE/%.c freertos/portable/IAR/AtmelSAM9XE/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-IAR-2f-AtmelSAM9XE

clean-freertos-2f-portable-2f-IAR-2f-AtmelSAM9XE:
	-$(RM) ./freertos/portable/IAR/AtmelSAM9XE/port.cyclo ./freertos/portable/IAR/AtmelSAM9XE/port.d ./freertos/portable/IAR/AtmelSAM9XE/port.o ./freertos/portable/IAR/AtmelSAM9XE/port.su

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-AtmelSAM9XE

