################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/IAR/MSP430X/port.c 

OBJS += \
./freertos/portable/IAR/MSP430X/port.o 

C_DEPS += \
./freertos/portable/IAR/MSP430X/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/MSP430X/%.o freertos/portable/IAR/MSP430X/%.su freertos/portable/IAR/MSP430X/%.cyclo: ../freertos/portable/IAR/MSP430X/%.c freertos/portable/IAR/MSP430X/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-IAR-2f-MSP430X

clean-freertos-2f-portable-2f-IAR-2f-MSP430X:
	-$(RM) ./freertos/portable/IAR/MSP430X/port.cyclo ./freertos/portable/IAR/MSP430X/port.d ./freertos/portable/IAR/MSP430X/port.o ./freertos/portable/IAR/MSP430X/port.su

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-MSP430X

