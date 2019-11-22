<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletAirQuality.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletAirQuality;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Air Quality Bricklet

// Callback function for all values callback
function cb_allValues($iaq_index, $iaq_index_accuracy, $temperature, $humidity,
                      $air_pressure)
{
    echo "IAQ Index: $iaq_index\n";

    if ($iaq_index_accuracy == BrickletAirQuality::ACCURACY_UNRELIABLE) {
        echo "IAQ Index Accuracy: Unreliable\n";
    } elseif ($iaq_index_accuracy == BrickletAirQuality::ACCURACY_LOW) {
        echo "IAQ Index Accuracy: Low\n";
    } elseif ($iaq_index_accuracy == BrickletAirQuality::ACCURACY_MEDIUM) {
        echo "IAQ Index Accuracy: Medium\n";
    } elseif ($iaq_index_accuracy == BrickletAirQuality::ACCURACY_HIGH) {
        echo "IAQ Index Accuracy: High\n";
    }

    echo "Temperature: " . $temperature/100.0 . " °C\n";
    echo "Humidity: " . $humidity/100.0 . " %RH\n";
    echo "Air Pressure: " . $air_pressure/100.0 . " hPa\n";
    echo "\n";
}

$ipcon = new IPConnection(); // Create IP connection
$aq = new BrickletAirQuality(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register all values callback to function cb_allValues
$aq->registerCallback(BrickletAirQuality::CALLBACK_ALL_VALUES, 'cb_allValues');

// Set period for all values callback to 1s (1000ms)
$aq->setAllValuesCallbackConfiguration(1000, FALSE);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
