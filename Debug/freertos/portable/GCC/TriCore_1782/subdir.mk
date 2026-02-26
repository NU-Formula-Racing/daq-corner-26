################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/TriCore_1782/port.c \
../freertos/portable/GCC/TriCore_1782/porttrap.c 

OBJS += \
./freertos/portable/GCC/TriCore_1782/port.o \
./freertos/portable/GCC/TriCore_1782/porttrap.o 

C_DEPS += \
./freertos/portable/GCC/TriCore_1782/port.d \
./freertos/portable/GCC/TriCore_1782/porttrap.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/TriCore_1782/%.o freertos/portable/GCC/TriCore_1782/%.su freertos/portable/GCC/TriCore_1782/%.cyclo: ../freertos/portable/GCC/TriCore_1782/%.c freertos/portable/GCC/TriCore_1782/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-TriCore_1782

clean-freertos-2f-portable-2f-GCC-2f-TriCore_1782:
	-$(RM) ./freertos/portable/GCC/TriCore_1782/port.cyclo ./freertos/portable/GCC/TriCore_1782/port.d ./freertos/portable/GCC/TriCore_1782/port.o ./freertos/portable/GCC/TriCore_1782/port.su ./freertos/portable/GCC/TriCore_1782/porttrap.cyclo ./freertos/portable/GCC/TriCore_1782/porttrap.d ./freertos/portable/GCC/TriCore_1782/porttrap.o ./freertos/portable/GCC/TriCore_1782/porttrap.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-TriCore_1782

