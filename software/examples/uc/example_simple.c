// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_air_quality.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_AirQuality aq;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_air_quality_create(&aq, NULL, hal), "create device object");

	// Get current all values
	int32_t iaq_index, temperature, humidity, air_pressure; uint8_t iaq_index_accuracy;
	check(tf_air_quality_get_all_values(&aq, &iaq_index, &iaq_index_accuracy,
	                                    &temperature, &humidity,
	                                    &air_pressure), "get all values");

	tf_hal_printf("IAQ Index: %I32d\n", iaq_index);

	if (iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_UNRELIABLE) {
		tf_hal_printf("IAQ Index Accuracy: Unreliable\n");
	} else if (iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_LOW) {
		tf_hal_printf("IAQ Index Accuracy: Low\n");
	} else if (iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_MEDIUM) {
		tf_hal_printf("IAQ Index Accuracy: Medium\n");
	} else if (iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_HIGH) {
		tf_hal_printf("IAQ Index Accuracy: High\n");
	}

	tf_hal_printf("Temperature: %d 1/%d °C\n", temperature, 100);
	tf_hal_printf("Humidity: %d 1/%d %%RH\n", humidity, 100);
	tf_hal_printf("Air Pressure: %d 1/%d hPa\n", air_pressure, 100);
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
