################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/IAR/RISC-V/portASM.s 

C_SRCS += \
../freertos/portable/IAR/RISC-V/port.c 

OBJS += \
./freertos/portable/IAR/RISC-V/port.o \
./freertos/portable/IAR/RISC-V/portASM.o 

S_DEPS += \
./freertos/portable/IAR/RISC-V/portASM.d 

C_DEPS += \
./freertos/portable/IAR/RISC-V/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/IAR/RISC-V/%.o freertos/portable/IAR/RISC-V/%.su freertos/portable/IAR/RISC-V/%.cyclo: ../freertos/portable/IAR/RISC-V/%.c freertos/portable/IAR/RISC-V/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/IAR/RISC-V/%.o: ../freertos/portable/IAR/RISC-V/%.s freertos/portable/IAR/RISC-V/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-IAR-2f-RISC-2d-V

clean-freertos-2f-portable-2f-IAR-2f-RISC-2d-V:
	-$(RM) ./freertos/portable/IAR/RISC-V/port.cyclo ./freertos/portable/IAR/RISC-V/port.d ./freertos/portable/IAR/RISC-V/port.o ./freertos/portable/IAR/RISC-V/port.su ./freertos/portable/IAR/RISC-V/portASM.d ./freertos/portable/IAR/RISC-V/portASM.o

.PHONY: clean-freertos-2f-portable-2f-IAR-2f-RISC-2d-V

