################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.c 

S_UPPER_SRCS += \
../freertos/portable/ThirdParty/CDK/T-HEAD_CK802/portasm.S 

OBJS += \
./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.o \
./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/portasm.o 

S_UPPER_DEPS += \
./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/portasm.d 

C_DEPS += \
./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.o freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.su freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.cyclo: ../freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.c freertos/portable/ThirdParty/CDK/T-HEAD_CK802/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.o: ../freertos/portable/ThirdParty/CDK/T-HEAD_CK802/%.S freertos/portable/ThirdParty/CDK/T-HEAD_CK802/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-ThirdParty-2f-CDK-2f-T-2d-HEAD_CK802

clean-freertos-2f-portable-2f-ThirdParty-2f-CDK-2f-T-2d-HEAD_CK802:
	-$(RM) ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.cyclo ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.d ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.o ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/port.su ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/portasm.d ./freertos/portable/ThirdParty/CDK/T-HEAD_CK802/portasm.o

.PHONY: clean-freertos-2f-portable-2f-ThirdParty-2f-CDK-2f-T-2d-HEAD_CK802

