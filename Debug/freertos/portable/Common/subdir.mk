################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/Common/mpu_wrappers.c \
../freertos/portable/Common/mpu_wrappers_v2.c 

OBJS += \
./freertos/portable/Common/mpu_wrappers.o \
./freertos/portable/Common/mpu_wrappers_v2.o 

C_DEPS += \
./freertos/portable/Common/mpu_wrappers.d \
./freertos/portable/Common/mpu_wrappers_v2.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/Common/%.o freertos/portable/Common/%.su freertos/portable/Common/%.cyclo: ../freertos/portable/Common/%.c freertos/portable/Common/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-Common

clean-freertos-2f-portable-2f-Common:
	-$(RM) ./freertos/portable/Common/mpu_wrappers.cyclo ./freertos/portable/Common/mpu_wrappers.d ./freertos/portable/Common/mpu_wrappers.o ./freertos/portable/Common/mpu_wrappers.su ./freertos/portable/Common/mpu_wrappers_v2.cyclo ./freertos/portable/Common/mpu_wrappers_v2.d ./freertos/portable/Common/mpu_wrappers_v2.o ./freertos/portable/Common/mpu_wrappers_v2.su

.PHONY: clean-freertos-2f-portable-2f-Common

