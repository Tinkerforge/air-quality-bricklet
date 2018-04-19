/* air-quality-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define VOC_ACCURACY_UNRELIABLE 0
#define VOC_ACCURACY_LOW 1
#define VOC_ACCURACY_MEDIUM 2
#define VOC_ACCURACY_HIGH 3

#define VOC_THRESHOLD_OPTION_OFF 'x'
#define VOC_THRESHOLD_OPTION_OUTSIDE 'o'
#define VOC_THRESHOLD_OPTION_INSIDE 'i'
#define VOC_THRESHOLD_OPTION_SMALLER '<'
#define VOC_THRESHOLD_OPTION_GREATER '>'

#define VOC_BOOTLOADER_MODE_BOOTLOADER 0
#define VOC_BOOTLOADER_MODE_FIRMWARE 1
#define VOC_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define VOC_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define VOC_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define VOC_BOOTLOADER_STATUS_OK 0
#define VOC_BOOTLOADER_STATUS_INVALID_MODE 1
#define VOC_BOOTLOADER_STATUS_NO_CHANGE 2
#define VOC_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define VOC_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define VOC_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define VOC_STATUS_LED_CONFIG_OFF 0
#define VOC_STATUS_LED_CONFIG_ON 1
#define VOC_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define VOC_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_GET_ALL_VALUES 1
#define FID_SET_TEMPERATURE_OFFSET 2
#define FID_GET_TEMPERATURE_OFFSET 3
#define FID_SET_ALL_VALUES_CALLBACK_CONFIGURATION 4
#define FID_GET_ALL_VALUES_CALLBACK_CONFIGURATION 5
#define FID_GET_IAQ_INDEX 7
#define FID_SET_IAQ_INDEX_CALLBACK_CONFIGURATION 8
#define FID_GET_IAQ_INDEX_CALLBACK_CONFIGURATION 9
#define FID_GET_TEMPERATURE 11
#define FID_SET_TEMPERATURE_CALLBACK_CONFIGURATION 12
#define FID_GET_TEMPERATURE_CALLBACK_CONFIGURATION 13
#define FID_GET_HUMIDITY 15
#define FID_SET_HUMIDITY_CALLBACK_CONFIGURATION 16
#define FID_GET_HUMIDITY_CALLBACK_CONFIGURATION 17
#define FID_GET_AIR_PRESSURE 19
#define FID_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION 20
#define FID_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION 21

#define FID_CALLBACK_ALL_VALUES 6
#define FID_CALLBACK_IAQ_INDEX 10
#define FID_CALLBACK_TEMPERATURE 14
#define FID_CALLBACK_HUMIDITY 18
#define FID_CALLBACK_AIR_PRESSURE 22

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetAllValues;

typedef struct {
	TFPMessageHeader header;
	int32_t iaq_index;
	uint8_t iaq_index_accuracy;
	int32_t temperature;
	int32_t humidity;
	int32_t air_pressure;
} __attribute__((__packed__)) GetAllValues_Response;

typedef struct {
	TFPMessageHeader header;
	int32_t offset;
} __attribute__((__packed__)) SetTemperatureOffset;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetTemperatureOffset;

typedef struct {
	TFPMessageHeader header;
	int32_t offset;
} __attribute__((__packed__)) GetTemperatureOffset_Response;

typedef struct {
	TFPMessageHeader header;
	uint32_t period;
	bool value_has_to_change;
} __attribute__((__packed__)) SetAllValuesCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetAllValuesCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
	uint32_t period;
	bool value_has_to_change;
} __attribute__((__packed__)) GetAllValuesCallbackConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	int32_t iaq_index;
	uint8_t iaq_index_accuracy;
	int32_t temperature;
	int32_t humidity;
	int32_t air_pressure;
} __attribute__((__packed__)) AllValues_Callback;


// Function prototypes
BootloaderHandleMessageResponse get_all_values(const GetAllValues *data, GetAllValues_Response *response);
BootloaderHandleMessageResponse set_temperature_offset(const SetTemperatureOffset *data);
BootloaderHandleMessageResponse get_temperature_offset(const GetTemperatureOffset *data, GetTemperatureOffset_Response *response);
BootloaderHandleMessageResponse set_all_values_callback_configuration(const SetAllValuesCallbackConfiguration *data);
BootloaderHandleMessageResponse get_all_values_callback_configuration(const GetAllValuesCallbackConfiguration *data, GetAllValuesCallbackConfiguration_Response *response);

// Callbacks
bool handle_all_values_callback(void);
bool handle_iaq_index_callback(void);
bool handle_temperature_callback(void);
bool handle_humidity_callback(void);
bool handle_air_pressure_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 5
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_all_values_callback, \
	handle_iaq_index_callback, \
	handle_temperature_callback, \
	handle_humidity_callback, \
	handle_air_pressure_callback, \


#endif
