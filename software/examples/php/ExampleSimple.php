<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletAirQuality.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletAirQuality;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Air Quality Bricklet

$ipcon = new IPConnection(); // Create IP connection
$aq = new BrickletAirQuality(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get current all values
$all_values = $aq->getAllValues();

echo "IAQ Index: " . $all_values['iaq_index'] . "\n";

if ($all_values['iaq_index_accuracy'] == BrickletAirQuality::ACCURACY_UNRELIABLE) {
    echo "IAQ Index Accuracy: Unreliable\n";
} elseif ($all_values['iaq_index_accuracy'] == BrickletAirQuality::ACCURACY_LOW) {
    echo "IAQ Index Accuracy: Low\n";
} elseif ($all_values['iaq_index_accuracy'] == BrickletAirQuality::ACCURACY_MEDIUM) {
    echo "IAQ Index Accuracy: Medium\n";
} elseif ($all_values['iaq_index_accuracy'] == BrickletAirQuality::ACCURACY_HIGH) {
    echo "IAQ Index Accuracy: High\n";
}

echo "Temperature: " . $all_values['temperature']/100.0 . " °C\n";
echo "Humidity: " . $all_values['humidity']/100.0 . " %RH\n";
echo "Air Pressure: " . $all_values['air_pressure']/100.0 . " hPa\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
