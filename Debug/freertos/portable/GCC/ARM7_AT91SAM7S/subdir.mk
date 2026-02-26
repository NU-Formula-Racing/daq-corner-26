################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.c \
../freertos/portable/GCC/ARM7_AT91SAM7S/port.c \
../freertos/portable/GCC/ARM7_AT91SAM7S/portISR.c 

OBJS += \
./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.o \
./freertos/portable/GCC/ARM7_AT91SAM7S/port.o \
./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.o 

C_DEPS += \
./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.d \
./freertos/portable/GCC/ARM7_AT91SAM7S/port.d \
./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/ARM7_AT91SAM7S/%.o freertos/portable/GCC/ARM7_AT91SAM7S/%.su freertos/portable/GCC/ARM7_AT91SAM7S/%.cyclo: ../freertos/portable/GCC/ARM7_AT91SAM7S/%.c freertos/portable/GCC/ARM7_AT91SAM7S/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S

clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S:
	-$(RM) ./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.cyclo ./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.d ./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.o ./freertos/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.su ./freertos/portable/GCC/ARM7_AT91SAM7S/port.cyclo ./freertos/portable/GCC/ARM7_AT91SAM7S/port.d ./freertos/portable/GCC/ARM7_AT91SAM7S/port.o ./freertos/portable/GCC/ARM7_AT91SAM7S/port.su ./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.cyclo ./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.d ./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.o ./freertos/portable/GCC/ARM7_AT91SAM7S/portISR.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S

