package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/air_quality_bricklet"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Air Quality Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	aq, _ := air_quality_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	aq.RegisterAllValuesCallback(func(iaqIndex int32, iaqIndexAccuracy air_quality_bricklet.Accuracy, temperature int32, humidity int32, airPressure int32) {
		fmt.Printf("IAQ Index: %d\n", iaqIndex)

		if iaqIndexAccuracy == air_quality_bricklet.AccuracyUnreliable {
			fmt.Println("IAQ Index Accuracy: Unreliable")
		} else if iaqIndexAccuracy == air_quality_bricklet.AccuracyLow {
			fmt.Println("IAQ Index Accuracy: Low")
		} else if iaqIndexAccuracy == air_quality_bricklet.AccuracyMedium {
			fmt.Println("IAQ Index Accuracy: Medium")
		} else if iaqIndexAccuracy == air_quality_bricklet.AccuracyHigh {
			fmt.Println("IAQ Index Accuracy: High")
		}

		fmt.Printf("Temperature: %f °C\n", float64(temperature)/100.0)
		fmt.Printf("Humidity: %f %RH\n", float64(humidity)/100.0)
		fmt.Printf("Air Pressure: %f mbar\n", float64(airPressure)/100.0)
		fmt.Println()
	})

	// Set period for all values callback to 1s (1000ms).
	aq.SetAllValuesCallbackConfiguration(1000, false)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
