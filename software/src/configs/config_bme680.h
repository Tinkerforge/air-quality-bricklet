/* air-quality-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_bme680.h: BME680 sensor configuration
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

#ifndef CONFIG_BME680_H
#define CONFIG_BME680_H

#define BME680_ENABLE_CALIBRATION   1

#define BME680_SPI_BAUDRATE         400000
#define BME680_USIC_CHANNEL         USIC0_CH1
#define BME680_USIC                 XMC_SPI0_CH1

#define BME680_SCLK_PIN             P0_8
#define BME680_SCLK_PIN_AF          (XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT7 | P0_8_AF_U0C1_SCLKOUT)

#define BME680_SELECT_PIN           P0_9
#define BME680_SELECT_PIN_AF        (XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT7 | P0_9_AF_U0C1_SELO0)

#define BME680_MOSI_PIN             P0_7
#define BME680_MOSI_PIN_AF          (XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT7 | P0_7_AF_U0C1_DOUT0)

#define BME680_MISO_PIN             P0_6
#define BME680_MISO_INPUT           XMC_USIC_CH_INPUT_DX0
#define BME680_MISO_SOURCE          0b010 // DX0C

#define BME680_SERVICE_REQUEST_RX   2
#define BME680_SERVICE_REQUEST_TX   3

#define BME680_IRQ_RX               11
#define BME680_IRQ_RX_PRIORITY      2
#define BME680_IRQ_TX               12
#define BME680_IRQ_TX_PRIORITY      3

#endif
