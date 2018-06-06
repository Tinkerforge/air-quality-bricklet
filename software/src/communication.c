/* air-quality-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/utility/callback_value.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "voc.h"

// FIXME: use a different data types, now that callback-value supports that?
CallbackValue_int32_t callback_value_humidity;
CallbackValue_int32_t callback_value_temperature;
CallbackValue_int32_t callback_value_air_pressure;
CallbackValue_int32_t callback_value_iaq_index;

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_ALL_VALUES: return get_all_values(message, response);
		case FID_SET_TEMPERATURE_OFFSET: return set_temperature_offset(message);
		case FID_GET_TEMPERATURE_OFFSET: return get_temperature_offset(message, response);
		case FID_SET_ALL_VALUES_CALLBACK_CONFIGURATION: return set_all_values_callback_configuration(message);
		case FID_GET_ALL_VALUES_CALLBACK_CONFIGURATION: return get_all_values_callback_configuration(message, response);
		case FID_GET_IAQ_INDEX: return get_callback_value_int32_t(message, response, &callback_value_iaq_index);
		case FID_SET_IAQ_INDEX_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int32_t(message, &callback_value_iaq_index);
		case FID_GET_IAQ_INDEX_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int32_t(message, response, &callback_value_iaq_index);
		case FID_GET_TEMPERATURE: return get_callback_value_int32_t(message, response, &callback_value_temperature);
		case FID_SET_TEMPERATURE_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int32_t(message, &callback_value_temperature);
		case FID_GET_TEMPERATURE_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int32_t(message, response, &callback_value_temperature);
		case FID_GET_HUMIDITY: return get_callback_value_int32_t(message, response, &callback_value_humidity);
		case FID_SET_HUMIDITY_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int32_t(message, &callback_value_humidity);
		case FID_GET_HUMIDITY_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int32_t(message, response, &callback_value_humidity);
		case FID_GET_AIR_PRESSURE: return get_callback_value_int32_t(message, response, &callback_value_air_pressure);
		case FID_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int32_t(message, &callback_value_air_pressure);
		case FID_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int32_t(message, response, &callback_value_air_pressure);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}

BootloaderHandleMessageResponse get_all_values(const GetAllValues *data, GetAllValues_Response *response) {
	response->header.length      = sizeof(GetAllValues_Response);
	response->air_pressure       = voc_get_air_pressure();
	response->humidity           = voc_get_humidity();
	response->iaq_index          = voc_get_iaq_index();
	response->iaq_index_accuracy = voc_get_iaq_index_accuracy();
	response->temperature        = voc_get_temperature();

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_temperature_offset(const SetTemperatureOffset *data) {
	voc.temperature_offset = data->offset;
	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_temperature_offset(const GetTemperatureOffset *data, GetTemperatureOffset_Response *response) {
	response->header.length = sizeof(GetTemperatureOffset_Response);
	response->offset        = voc.temperature_offset;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_all_values_callback_configuration(const SetAllValuesCallbackConfiguration *data) {
	voc.callback_value_has_to_change = data->value_has_to_change;
	voc.callback_period              = data->period;
	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_all_values_callback_configuration(const GetAllValuesCallbackConfiguration *data, GetAllValuesCallbackConfiguration_Response *response) {
	response->header.length       = sizeof(GetAllValuesCallbackConfiguration_Response);
	response->value_has_to_change = voc.callback_value_has_to_change;
	response->period              = voc.callback_period;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

bool handle_all_values_callback(void) {
	static bool is_buffered = false;
	static AllValues_Callback cb;
	static int32_t last_iaq_index = 0;
	static uint8_t last_iaq_index_accuracy = 0;
	static int32_t last_humidity = 0;
	static int32_t last_air_pressure = 0;
	static int32_t last_temperature = 0;
	static uint32_t last_time = 0;

	if(!is_buffered) {
		if(voc.callback_period == 0 ||
		    !system_timer_is_time_elapsed_ms(last_time, voc.callback_period)) {
			return false;
		}

		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(AllValues_Callback), FID_CALLBACK_ALL_VALUES);
		cb.air_pressure       = voc_get_air_pressure();
		cb.humidity           = voc_get_humidity();
		cb.iaq_index          = voc_get_iaq_index();
		cb.iaq_index_accuracy = voc_get_iaq_index_accuracy();
		cb.temperature        = voc_get_temperature();

		if(voc.callback_value_has_to_change && last_iaq_index == cb.iaq_index && last_iaq_index_accuracy == cb.iaq_index_accuracy &&
		   last_humidity == cb.humidity && last_air_pressure == cb.air_pressure && last_temperature == cb.temperature) {
			return false;
		}

		last_iaq_index          = cb.iaq_index;
		last_iaq_index_accuracy = cb.iaq_index_accuracy;
		last_humidity           = cb.humidity;
		last_air_pressure       = cb.air_pressure;
		last_temperature        = cb.temperature;
		last_time = system_timer_get_ms();
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(AllValues_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

bool handle_iaq_index_callback(void) {
	return handle_callback_value_callback_int32_t(&callback_value_iaq_index, FID_CALLBACK_IAQ_INDEX);
}

bool handle_temperature_callback(void) {
	return handle_callback_value_callback_int32_t(&callback_value_temperature, FID_CALLBACK_TEMPERATURE);
}

bool handle_humidity_callback(void) {
	return handle_callback_value_callback_int32_t(&callback_value_humidity, FID_CALLBACK_HUMIDITY);
}

bool handle_air_pressure_callback(void) {
	return handle_callback_value_callback_int32_t(&callback_value_air_pressure, FID_CALLBACK_AIR_PRESSURE);
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	callback_value_init_int32_t(&callback_value_humidity, voc_get_humidity);
	callback_value_init_int32_t(&callback_value_temperature, voc_get_temperature);
	callback_value_init_int32_t(&callback_value_air_pressure, voc_get_air_pressure);
	callback_value_init_int32_t(&callback_value_iaq_index, voc_get_iaq_index);

	communication_callback_init();
}
