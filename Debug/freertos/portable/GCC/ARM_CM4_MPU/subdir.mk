################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.c \
../freertos/portable/GCC/ARM_CM4_MPU/port.c 

OBJS += \
./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.o \
./freertos/portable/GCC/ARM_CM4_MPU/port.o 

C_DEPS += \
./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.d \
./freertos/portable/GCC/ARM_CM4_MPU/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/ARM_CM4_MPU/%.o freertos/portable/GCC/ARM_CM4_MPU/%.su freertos/portable/GCC/ARM_CM4_MPU/%.cyclo: ../freertos/portable/GCC/ARM_CM4_MPU/%.c freertos/portable/GCC/ARM_CM4_MPU/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-ARM_CM4_MPU

clean-freertos-2f-portable-2f-GCC-2f-ARM_CM4_MPU:
	-$(RM) ./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.cyclo ./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.d ./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.o ./freertos/portable/GCC/ARM_CM4_MPU/mpu_wrappers_v2_asm.su ./freertos/portable/GCC/ARM_CM4_MPU/port.cyclo ./freertos/portable/GCC/ARM_CM4_MPU/port.d ./freertos/portable/GCC/ARM_CM4_MPU/port.o ./freertos/portable/GCC/ARM_CM4_MPU/port.su

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-ARM_CM4_MPU

