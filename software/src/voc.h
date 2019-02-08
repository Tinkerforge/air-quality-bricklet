/* air-quality-bricklet
 * Copyright (C) 2017-2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * voc.h: Air Quality Bricklet read/write state machine
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

#ifndef VOC_H
#define VOC_H

#include "bme680.h"

#include <stdbool.h>
#include <stdint.h>

#include "bsec_datatypes.h"

#define DATA_SPI_BUFFER_SIZE 128

// VOC state has max size of 400 bytes, so it fits in two pages
#define VOC_STATE_DATA1_PAGE        1
#define VOC_STATE_DATA2_PAGE        2

// Info is written at end of data2 page
#define VOC_STATE_INFO_DURATION_POS (EEPROM_PAGE_SIZE/sizeof(uint32_t) - 4)
#define VOC_STATE_INFO_MAGIC_POS    (EEPROM_PAGE_SIZE/sizeof(uint32_t) - 3)
#define VOC_STATE_INFO_LENGTH_POS   (EEPROM_PAGE_SIZE/sizeof(uint32_t) - 2)
#define VOC_STATE_INFO_CHECKSUM_POS (EEPROM_PAGE_SIZE/sizeof(uint32_t) - 1)

// Increase magic number in firmware version 2.0.3, to make sure
// that the old calibration is discarded and a new one is started.
// We need to do this since we updated the BSEC and it seems like
// the old calibration data is not compatible.
#define VOC_STATE_MAGIC             (0x12345678 + 1)

typedef struct {
	struct bme680_dev bme680;

	uint8_t data_spi[DATA_SPI_BUFFER_SIZE];
	uint8_t data_read_index;
	uint8_t data_write_index;
	uint16_t data_length;

	uint8_t work_buffer[BSEC_MAX_PROPERTY_BLOB_SIZE];

	int32_t compensated_humidity;
	int32_t compensated_temperature;
	int32_t iaq_index;

    uint8_t iaq_accuracy;

    float raw_temperature;
    float raw_air_pressure;
    float raw_humidity;
    float raw_gas;

    uint8_t run_in_status;
    uint8_t stabilization_status;

	bool all_values_callback_value_has_to_change;
	uint32_t all_values_callback_period;

	bool iaq_index_callback_value_has_to_change;
	uint32_t iaq_index_callback_period;

	int32_t temperature_offset;

	uint8_t calibration_duration;
	bool new_calibration_duration;
} VOC;

extern VOC voc;

void voc_init(void);
void voc_tick(void);

void voc_state_invalidate(void);

int32_t voc_get_humidity(void);
int32_t voc_get_temperature(void);
int32_t voc_get_air_pressure(void);
int32_t voc_get_iaq_index(void);
uint8_t voc_get_iaq_index_accuracy(void);

#define REG_READ 0x80

#endif
