################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/examples/cmake_example/main.c 

OBJS += \
./freertos/examples/cmake_example/main.o 

C_DEPS += \
./freertos/examples/cmake_example/main.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/examples/cmake_example/%.o freertos/examples/cmake_example/%.su freertos/examples/cmake_example/%.cyclo: ../freertos/examples/cmake_example/%.c freertos/examples/cmake_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-examples-2f-cmake_example

clean-freertos-2f-examples-2f-cmake_example:
	-$(RM) ./freertos/examples/cmake_example/main.cyclo ./freertos/examples/cmake_example/main.d ./freertos/examples/cmake_example/main.o ./freertos/examples/cmake_example/main.su

.PHONY: clean-freertos-2f-examples-2f-cmake_example

