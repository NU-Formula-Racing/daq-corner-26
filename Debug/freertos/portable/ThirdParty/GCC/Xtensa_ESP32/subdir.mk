################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.c \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.c \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.c \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.c \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.c \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.c 

S_UPPER_SRCS += \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.S \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.S \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.S \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.S \
../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.S 

OBJS += \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o 

S_UPPER_DEPS += \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d 

C_DEPS += \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d \
./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.o freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.su freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.cyclo: ../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.c freertos/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F405xx -c -I../Core/Inc -I../DriversCustom/Ads -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../freertos/include -I../freertos/portable/GCC/ARM_CM4F -I../DriversCustom/RTOS -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.o: ../freertos/portable/ThirdParty/GCC/Xtensa_ESP32/%.S freertos/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32:
	-$(RM) ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.cyclo ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.su ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d ./freertos/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o

.PHONY: clean-freertos-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

