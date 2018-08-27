var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Air Quality Bricklet

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var aq = new Tinkerforge.BrickletAirQuality(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Set period for all values callback to 1s (1000ms) without a threshold
        aq.setAllValuesCallbackConfiguration(1000, false, 'x', 0, 0);
    }
);

// Register all values callback
aq.on(Tinkerforge.BrickletAirQuality.CALLBACK_ALL_VALUES,
    // Callback function for all values callback
    function (iaqIndex, iaqIndexAccuracy, temperature, humidity, airPressure) {
        console.log('IAQ Index: ' + iaqIndex);

        if(iaqIndexAccuracy === Tinkerforge.BrickletAirQuality.ACCURACY_UNRELIABLE) {
            console.log('IAQ Index Accuracy: Unreliable');
        }
        else if(iaqIndexAccuracy === Tinkerforge.BrickletAirQuality.ACCURACY_LOW) {
            console.log('IAQ Index Accuracy: Low');
        }
        else if(iaqIndexAccuracy === Tinkerforge.BrickletAirQuality.ACCURACY_MEDIUM) {
            console.log('IAQ Index Accuracy: Medium');
        }
        else if(iaqIndexAccuracy === Tinkerforge.BrickletAirQuality.ACCURACY_HIGH) {
            console.log('IAQ Index Accuracy: High');
        }

        console.log('Temperature: ' + temperature/100.0 + ' °C');
        console.log('Humidity: ' + humidity/100.0 + ' %RH');
        console.log('Air Pressure: ' + airPressure/100.0 + ' mbar');
        console.log();
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
