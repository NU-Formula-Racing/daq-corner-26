################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/CodeWarrior/ColdFire_V2/port.c 

S_UPPER_SRCS += \
../freertos/portable/CodeWarrior/ColdFire_V2/portasm.S 

OBJS += \
./freertos/portable/CodeWarrior/ColdFire_V2/port.o \
./freertos/portable/CodeWarrior/ColdFire_V2/portasm.o 

S_UPPER_DEPS += \
./freertos/portable/CodeWarrior/ColdFire_V2/portasm.d 

C_DEPS += \
./freertos/portable/CodeWarrior/ColdFire_V2/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/CodeWarrior/ColdFire_V2/%.o freertos/portable/CodeWarrior/ColdFire_V2/%.su freertos/portable/CodeWarrior/ColdFire_V2/%.cyclo: ../freertos/portable/CodeWarrior/ColdFire_V2/%.c freertos/portable/CodeWarrior/ColdFire_V2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/CodeWarrior/ColdFire_V2/%.o: ../freertos/portable/CodeWarrior/ColdFire_V2/%.S freertos/portable/CodeWarrior/ColdFire_V2/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-CodeWarrior-2f-ColdFire_V2

clean-freertos-2f-portable-2f-CodeWarrior-2f-ColdFire_V2:
	-$(RM) ./freertos/portable/CodeWarrior/ColdFire_V2/port.cyclo ./freertos/portable/CodeWarrior/ColdFire_V2/port.d ./freertos/portable/CodeWarrior/ColdFire_V2/port.o ./freertos/portable/CodeWarrior/ColdFire_V2/port.su ./freertos/portable/CodeWarrior/ColdFire_V2/portasm.d ./freertos/portable/CodeWarrior/ColdFire_V2/portasm.o

.PHONY: clean-freertos-2f-portable-2f-CodeWarrior-2f-ColdFire_V2

