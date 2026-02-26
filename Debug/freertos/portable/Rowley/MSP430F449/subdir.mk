################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/Rowley/MSP430F449/port.c 

OBJS += \
./freertos/portable/Rowley/MSP430F449/port.o 

C_DEPS += \
./freertos/portable/Rowley/MSP430F449/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/Rowley/MSP430F449/%.o freertos/portable/Rowley/MSP430F449/%.su freertos/portable/Rowley/MSP430F449/%.cyclo: ../freertos/portable/Rowley/MSP430F449/%.c freertos/portable/Rowley/MSP430F449/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-Rowley-2f-MSP430F449

clean-freertos-2f-portable-2f-Rowley-2f-MSP430F449:
	-$(RM) ./freertos/portable/Rowley/MSP430F449/port.cyclo ./freertos/portable/Rowley/MSP430F449/port.d ./freertos/portable/Rowley/MSP430F449/port.o ./freertos/portable/Rowley/MSP430F449/port.su

.PHONY: clean-freertos-2f-portable-2f-Rowley-2f-MSP430F449

