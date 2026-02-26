################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/ARM7_AT91FR40008/port.c \
../freertos/portable/GCC/ARM7_AT91FR40008/portISR.c 

OBJS += \
./freertos/portable/GCC/ARM7_AT91FR40008/port.o \
./freertos/portable/GCC/ARM7_AT91FR40008/portISR.o 

C_DEPS += \
./freertos/portable/GCC/ARM7_AT91FR40008/port.d \
./freertos/portable/GCC/ARM7_AT91FR40008/portISR.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/ARM7_AT91FR40008/%.o freertos/portable/GCC/ARM7_AT91FR40008/%.su freertos/portable/GCC/ARM7_AT91FR40008/%.cyclo: ../freertos/portable/GCC/ARM7_AT91FR40008/%.c freertos/portable/GCC/ARM7_AT91FR40008/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91FR40008

clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91FR40008:
	-$(RM) ./freertos/portable/GCC/ARM7_AT91FR40008/port.cyclo ./freertos/portable/GCC/ARM7_AT91FR40008/port.d ./freertos/portable/GCC/ARM7_AT91FR40008/port.o ./freertos/portable/GCC/ARM7_AT91FR40008/port.su ./freertos/portable/GCC/ARM7_AT91FR40008/portISR.cyclo ./freertos/portable/GCC/ARM7_AT91FR40008/portISR.d ./freertos/portable/GCC/ARM7_AT91FR40008/portISR.o ./freertos/portable/GCC/ARM7_AT91FR40008/portISR.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91FR40008

