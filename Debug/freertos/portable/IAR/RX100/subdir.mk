################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/IAR/RX100/port_asm.s 

C_SRCS += \
../freertos/portable/IAR/RX100/port.c 

OBJS += \
./freertos/portable/IAR/RX100/port.o \
./freertos/portable/IAR/RX100/port_asm.o 

S_DEPS += \
./freertos/portable/IAR/RX100/port_asm.d 

C_DEPS += \
./freertos/portable/IAR/RX100/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/RX100/%.o freertos/portable/IAR/RX100/%.su freertos/portable/IAR/RX100/%.cyclo: ../freertos/portable/IAR/RX100/%.c freertos/portable/IAR/RX100/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/IAR/RX100/%.o: ../freertos/portable/IAR/RX100/%.s freertos/portable/IAR/RX100/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-IAR-2f-RX100

clean-freertos-2f-portable-2f-IAR-2f-RX100:
	-$(RM) ./freertos/portable/IAR/RX100/port.cyclo ./freertos/portable/IAR/RX100/port.d ./freertos/portable/IAR/RX100/port.o ./freertos/portable/IAR/RX100/port.su ./freertos/portable/IAR/RX100/port_asm.d ./freertos/portable/IAR/RX100/port_asm.o

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-RX100

