################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../freertos/portable/RVDS/ARM7_LPC21xx/portASM.s 

C_SRCS += \
../freertos/portable/RVDS/ARM7_LPC21xx/port.c 

OBJS += \
./freertos/portable/RVDS/ARM7_LPC21xx/port.o \
./freertos/portable/RVDS/ARM7_LPC21xx/portASM.o 

S_DEPS += \
./freertos/portable/RVDS/ARM7_LPC21xx/portASM.d 

C_DEPS += \
./freertos/portable/RVDS/ARM7_LPC21xx/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/RVDS/ARM7_LPC21xx/%.o freertos/portable/RVDS/ARM7_LPC21xx/%.su freertos/portable/RVDS/ARM7_LPC21xx/%.cyclo: ../freertos/portable/RVDS/ARM7_LPC21xx/%.c freertos/portable/RVDS/ARM7_LPC21xx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/RVDS/ARM7_LPC21xx/%.o: ../freertos/portable/RVDS/ARM7_LPC21xx/%.s freertos/portable/RVDS/ARM7_LPC21xx/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-RVDS-2f-ARM7_LPC21xx

clean-freertos-2f-portable-2f-RVDS-2f-ARM7_LPC21xx:
	-$(RM) ./freertos/portable/RVDS/ARM7_LPC21xx/port.cyclo ./freertos/portable/RVDS/ARM7_LPC21xx/port.d ./freertos/portable/RVDS/ARM7_LPC21xx/port.o ./freertos/portable/RVDS/ARM7_LPC21xx/port.su ./freertos/portable/RVDS/ARM7_LPC21xx/portASM.d ./freertos/portable/RVDS/ARM7_LPC21xx/portASM.o

.PHONY: clean-freertos-2f-portable-2f-RVDS-2f-ARM7_LPC21xx

