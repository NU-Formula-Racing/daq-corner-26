################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/RVDS/ARM_CA9/portASM.s 

C_SRCS += \
../freertos/portable/RVDS/ARM_CA9/port.c 

OBJS += \
./freertos/portable/RVDS/ARM_CA9/port.o \
./freertos/portable/RVDS/ARM_CA9/portASM.o 

S_DEPS += \
./freertos/portable/RVDS/ARM_CA9/portASM.d 

C_DEPS += \
./freertos/portable/RVDS/ARM_CA9/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/RVDS/ARM_CA9/%.o freertos/portable/RVDS/ARM_CA9/%.su freertos/portable/RVDS/ARM_CA9/%.cyclo: ../freertos/portable/RVDS/ARM_CA9/%.c freertos/portable/RVDS/ARM_CA9/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/RVDS/ARM_CA9/%.o: ../freertos/portable/RVDS/ARM_CA9/%.s freertos/portable/RVDS/ARM_CA9/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-RVDS-2f-ARM_CA9

clean-freertos-2f-portable-2f-RVDS-2f-ARM_CA9:
	-$(RM) ./freertos/portable/RVDS/ARM_CA9/port.cyclo ./freertos/portable/RVDS/ARM_CA9/port.d ./freertos/portable/RVDS/ARM_CA9/port.o ./freertos/portable/RVDS/ARM_CA9/port.su ./freertos/portable/RVDS/ARM_CA9/portASM.d ./freertos/portable/RVDS/ARM_CA9/portASM.o

.PHONY: clean-freertos-2f-portable-2f-RVDS-2f-ARM_CA9

