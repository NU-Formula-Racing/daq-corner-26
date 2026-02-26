################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/IAR/ARM_CRx_No_GIC/portASM.s 

C_SRCS += \
../freertos/portable/IAR/ARM_CRx_No_GIC/port.c 

OBJS += \
./freertos/portable/IAR/ARM_CRx_No_GIC/port.o \
./freertos/portable/IAR/ARM_CRx_No_GIC/portASM.o 

S_DEPS += \
./freertos/portable/IAR/ARM_CRx_No_GIC/portASM.d 

C_DEPS += \
./freertos/portable/IAR/ARM_CRx_No_GIC/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/ARM_CRx_No_GIC/%.o freertos/portable/IAR/ARM_CRx_No_GIC/%.su freertos/portable/IAR/ARM_CRx_No_GIC/%.cyclo: ../freertos/portable/IAR/ARM_CRx_No_GIC/%.c freertos/portable/IAR/ARM_CRx_No_GIC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/IAR/ARM_CRx_No_GIC/%.o: ../freertos/portable/IAR/ARM_CRx_No_GIC/%.s freertos/portable/IAR/ARM_CRx_No_GIC/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-IAR-2f-ARM_CRx_No_GIC

clean-freertos-2f-portable-2f-IAR-2f-ARM_CRx_No_GIC:
	-$(RM) ./freertos/portable/IAR/ARM_CRx_No_GIC/port.cyclo ./freertos/portable/IAR/ARM_CRx_No_GIC/port.d ./freertos/portable/IAR/ARM_CRx_No_GIC/port.o ./freertos/portable/IAR/ARM_CRx_No_GIC/port.su ./freertos/portable/IAR/ARM_CRx_No_GIC/portASM.d ./freertos/portable/IAR/ARM_CRx_No_GIC/portASM.o

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-ARM_CRx_No_GIC

