#include "bindings/hal_common.h"
#include "bindings/bricklet_air_quality.h"

#define UID "XYZ" // Change XYZ to the UID of your Air Quality Bricklet

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


// Callback function for all values callback
static void all_values_handler(TF_AirQuality *device, int32_t iaq_index,
                               uint8_t iaq_index_accuracy, int32_t temperature,
                               int32_t humidity, int32_t air_pressure, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("IAQ Index: %d\n", iaq_index);

	if(iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_UNRELIABLE) {
		tf_hal_printf("IAQ Index Accuracy: Unreliable\n");
	} else if(iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_LOW) {
		tf_hal_printf("IAQ Index Accuracy: Low\n");
	} else if(iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_MEDIUM) {
		tf_hal_printf("IAQ Index Accuracy: Medium\n");
	} else if(iaq_index_accuracy == TF_AIR_QUALITY_ACCURACY_HIGH) {
		tf_hal_printf("IAQ Index Accuracy: High\n");
	}

	tf_hal_printf("Temperature: %d 1/%d °C\n", temperature, 100.0);
	tf_hal_printf("Humidity: %d 1/%d %%RH\n", humidity, 100.0);
	tf_hal_printf("Air Pressure: %d 1/%d hPa\n", air_pressure, 100.0);
	tf_hal_printf("\n");
}

static TF_AirQuality aq;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_air_quality_create(&aq, UID, hal), "create device object");

	// Register all values callback to function all_values_handler
	tf_air_quality_register_all_values_callback(&aq,
	                                            all_values_handler,
	                                            NULL);

	// Set period for all values callback to 1s (1000ms)
	tf_air_quality_set_all_values_callback_configuration(&aq, 1000, false);
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
