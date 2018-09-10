import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletAirQuality;

public class ExampleCallback {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Air Quality Bricklet
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletAirQuality aq = new BrickletAirQuality(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Add all values listener
		aq.addAllValuesListener(new BrickletAirQuality.AllValuesListener() {
			public void allValues(int iaqIndex, int iaqIndexAccuracy, int temperature,
			                      int humidity, int airPressure) {
				System.out.println("IAQ Index: " + iaqIndex);

				if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_UNRELIABLE) {
					System.out.println("IAQ Index Accuracy: Unreliable");
				} else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_LOW) {
					System.out.println("IAQ Index Accuracy: Low");
				} else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_MEDIUM) {
					System.out.println("IAQ Index Accuracy: Medium");
				} else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_HIGH) {
					System.out.println("IAQ Index Accuracy: High");
				}

				System.out.println("Temperature: " + temperature/100.0 + " °C");
				System.out.println("Humidity: " + humidity/100.0 + " %RH");
				System.out.println("Air Pressure: " + airPressure/100.0 + " mbar");
				System.out.println("");
			}
		});

		// Set period for all values callback to 1s (1000ms)
		aq.setAllValuesCallbackConfiguration(1000, false);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
