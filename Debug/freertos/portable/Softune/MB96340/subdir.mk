################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/Softune/MB96340/__STD_LIB_sbrk.c \
../freertos/portable/Softune/MB96340/port.c 

OBJS += \
./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.o \
./freertos/portable/Softune/MB96340/port.o 

C_DEPS += \
./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.d \
./freertos/portable/Softune/MB96340/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/Softune/MB96340/%.o freertos/portable/Softune/MB96340/%.su freertos/portable/Softune/MB96340/%.cyclo: ../freertos/portable/Softune/MB96340/%.c freertos/portable/Softune/MB96340/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-Softune-2f-MB96340

clean-freertos-2f-portable-2f-Softune-2f-MB96340:
	-$(RM) ./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.cyclo ./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.d ./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.o ./freertos/portable/Softune/MB96340/__STD_LIB_sbrk.su ./freertos/portable/Softune/MB96340/port.cyclo ./freertos/portable/Softune/MB96340/port.d ./freertos/portable/Softune/MB96340/port.o ./freertos/portable/Softune/MB96340/port.su

.PHONY: clean-freertos-2f-portable-2f-Softune-2f-MB96340

