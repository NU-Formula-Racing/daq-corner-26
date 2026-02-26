################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/GCC/ARM_CRx_MPU/port.c 

S_UPPER_SRCS += \
../freertos/portable/GCC/ARM_CRx_MPU/mpu_wrappers_v2_asm.S \
../freertos/portable/GCC/ARM_CRx_MPU/portASM.S 

OBJS += \
./freertos/portable/GCC/ARM_CRx_MPU/mpu_wrappers_v2_asm.o \
./freertos/portable/GCC/ARM_CRx_MPU/port.o \
./freertos/portable/GCC/ARM_CRx_MPU/portASM.o 

S_UPPER_DEPS += \
./freertos/portable/GCC/ARM_CRx_MPU/mpu_wrappers_v2_asm.d \
./freertos/portable/GCC/ARM_CRx_MPU/portASM.d 

C_DEPS += \
./freertos/portable/GCC/ARM_CRx_MPU/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/GCC/ARM_CRx_MPU/%.o: ../freertos/portable/GCC/ARM_CRx_MPU/%.S freertos/portable/GCC/ARM_CRx_MPU/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
freertos/portable/GCC/ARM_CRx_MPU/%.o freertos/portable/GCC/ARM_CRx_MPU/%.su freertos/portable/GCC/ARM_CRx_MPU/%.cyclo: ../freertos/portable/GCC/ARM_CRx_MPU/%.c freertos/portable/GCC/ARM_CRx_MPU/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-GCC-2f-ARM_CRx_MPU

clean-freertos-2f-portable-2f-GCC-2f-ARM_CRx_MPU:
	-$(RM) ./freertos/portable/GCC/ARM_CRx_MPU/mpu_wrappers_v2_asm.d ./freertos/portable/GCC/ARM_CRx_MPU/mpu_wrappers_v2_asm.o ./freertos/portable/GCC/ARM_CRx_MPU/port.cyclo ./freertos/portable/GCC/ARM_CRx_MPU/port.d ./freertos/portable/GCC/ARM_CRx_MPU/port.o ./freertos/portable/GCC/ARM_CRx_MPU/port.su ./freertos/portable/GCC/ARM_CRx_MPU/portASM.d ./freertos/portable/GCC/ARM_CRx_MPU/portASM.o

.PHONY: clean-freertos-2f-portable-2f-GCC-2f-ARM_CRx_MPU

