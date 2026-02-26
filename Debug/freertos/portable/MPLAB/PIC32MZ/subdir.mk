################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/MPLAB/PIC32MZ/port.c 

S_UPPER_SRCS += \
../freertos/portable/MPLAB/PIC32MZ/port_asm.S 

OBJS += \
./freertos/portable/MPLAB/PIC32MZ/port.o \
./freertos/portable/MPLAB/PIC32MZ/port_asm.o 

S_UPPER_DEPS += \
./freertos/portable/MPLAB/PIC32MZ/port_asm.d 

C_DEPS += \
./freertos/portable/MPLAB/PIC32MZ/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/MPLAB/PIC32MZ/%.o freertos/portable/MPLAB/PIC32MZ/%.su freertos/portable/MPLAB/PIC32MZ/%.cyclo: ../freertos/portable/MPLAB/PIC32MZ/%.c freertos/portable/MPLAB/PIC32MZ/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/MPLAB/PIC32MZ/%.o: ../freertos/portable/MPLAB/PIC32MZ/%.S freertos/portable/MPLAB/PIC32MZ/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-MPLAB-2f-PIC32MZ

clean-freertos-2f-portable-2f-MPLAB-2f-PIC32MZ:
	-$(RM) ./freertos/portable/MPLAB/PIC32MZ/port.cyclo ./freertos/portable/MPLAB/PIC32MZ/port.d ./freertos/portable/MPLAB/PIC32MZ/port.o ./freertos/portable/MPLAB/PIC32MZ/port.su ./freertos/portable/MPLAB/PIC32MZ/port_asm.d ./freertos/portable/MPLAB/PIC32MZ/port_asm.o

.PHONY: clean-freertos-2f-portable-2f-MPLAB-2f-PIC32MZ

