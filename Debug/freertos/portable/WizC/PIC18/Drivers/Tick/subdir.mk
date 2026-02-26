################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/WizC/PIC18/Drivers/Tick/Tick.c \
../freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.c 

OBJS += \
./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.o \
./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.o 

C_DEPS += \
./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.d \
./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/WizC/PIC18/Drivers/Tick/%.o freertos/portable/WizC/PIC18/Drivers/Tick/%.su freertos/portable/WizC/PIC18/Drivers/Tick/%.cyclo: ../freertos/portable/WizC/PIC18/Drivers/Tick/%.c freertos/portable/WizC/PIC18/Drivers/Tick/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-freertos-2f-portable-2f-WizC-2f-PIC18-2f-Drivers-2f-Tick

clean-freertos-2f-portable-2f-WizC-2f-PIC18-2f-Drivers-2f-Tick:
	-$(RM) ./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.cyclo ./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.d ./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.o ./freertos/portable/WizC/PIC18/Drivers/Tick/Tick.su ./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.cyclo ./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.d ./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.o ./freertos/portable/WizC/PIC18/Drivers/Tick/isrTick.su

.PHONY: clean-freertos-2f-portable-2f-WizC-2f-PIC18-2f-Drivers-2f-Tick

