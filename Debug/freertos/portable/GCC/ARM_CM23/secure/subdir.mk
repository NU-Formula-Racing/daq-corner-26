################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/ARM_CM23/secure/secure_context.c \
../freertos/portable/GCC/ARM_CM23/secure/secure_context_port.c \
../freertos/portable/GCC/ARM_CM23/secure/secure_heap.c \
../freertos/portable/GCC/ARM_CM23/secure/secure_init.c 

OBJS += \
./freertos/portable/GCC/ARM_CM23/secure/secure_context.o \
./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.o \
./freertos/portable/GCC/ARM_CM23/secure/secure_heap.o \
./freertos/portable/GCC/ARM_CM23/secure/secure_init.o 

C_DEPS += \
./freertos/portable/GCC/ARM_CM23/secure/secure_context.d \
./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.d \
./freertos/portable/GCC/ARM_CM23/secure/secure_heap.d \
./freertos/portable/GCC/ARM_CM23/secure/secure_init.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/ARM_CM23/secure/%.o freertos/portable/GCC/ARM_CM23/secure/%.su freertos/portable/GCC/ARM_CM23/secure/%.cyclo: ../freertos/portable/GCC/ARM_CM23/secure/%.c freertos/portable/GCC/ARM_CM23/secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure

clean-freertos-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure:
	-$(RM) ./freertos/portable/GCC/ARM_CM23/secure/secure_context.cyclo ./freertos/portable/GCC/ARM_CM23/secure/secure_context.d ./freertos/portable/GCC/ARM_CM23/secure/secure_context.o ./freertos/portable/GCC/ARM_CM23/secure/secure_context.su ./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.cyclo ./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.d ./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.o ./freertos/portable/GCC/ARM_CM23/secure/secure_context_port.su ./freertos/portable/GCC/ARM_CM23/secure/secure_heap.cyclo ./freertos/portable/GCC/ARM_CM23/secure/secure_heap.d ./freertos/portable/GCC/ARM_CM23/secure/secure_heap.o ./freertos/portable/GCC/ARM_CM23/secure/secure_heap.su ./freertos/portable/GCC/ARM_CM23/secure/secure_init.cyclo ./freertos/portable/GCC/ARM_CM23/secure/secure_init.d ./freertos/portable/GCC/ARM_CM23/secure/secure_init.o ./freertos/portable/GCC/ARM_CM23/secure/secure_init.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-ARM_CM23-2f-secure

