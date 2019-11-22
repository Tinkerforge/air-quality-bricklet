using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Air Quality Bricklet

	// Callback function for all values callback
	static void AllValuesCB(BrickletAirQuality sender, int iaqIndex,
	                        byte iaqIndexAccuracy, int temperature, int humidity,
	                        int airPressure)
	{
		Console.WriteLine("IAQ Index: " + iaqIndex);

		if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_UNRELIABLE)
		{
			Console.WriteLine("IAQ Index Accuracy: Unreliable");
		}
		else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_LOW)
		{
			Console.WriteLine("IAQ Index Accuracy: Low");
		}
		else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_MEDIUM)
		{
			Console.WriteLine("IAQ Index Accuracy: Medium");
		}
		else if(iaqIndexAccuracy == BrickletAirQuality.ACCURACY_HIGH)
		{
			Console.WriteLine("IAQ Index Accuracy: High");
		}

		Console.WriteLine("Temperature: " + temperature/100.0 + " °C");
		Console.WriteLine("Humidity: " + humidity/100.0 + " %RH");
		Console.WriteLine("Air Pressure: " + airPressure/100.0 + " hPa");
		Console.WriteLine("");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletAirQuality aq = new BrickletAirQuality(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register all values callback to function AllValuesCB
		aq.AllValuesCallback += AllValuesCB;

		// Set period for all values callback to 1s (1000ms)
		aq.SetAllValuesCallbackConfiguration(1000, false);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
