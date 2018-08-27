function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletAirQuality;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Air Quality Bricklet

    ipcon = IPConnection(); % Create IP connection
    aq = handle(BrickletAirQuality(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current all values
    allValues = aq.getAllValues();

    fprintf('IAQ Index: %i\n', allValues.iaqIndex);

    if allValues.iaqIndexAccuracy == BrickletAirQuality.ACCURACY_UNRELIABLE
        fprintf('IAQ Index Accuracy: Unreliable\n');
    elseif allValues.iaqIndexAccuracy == BrickletAirQuality.ACCURACY_LOW
        fprintf('IAQ Index Accuracy: Low\n');
    elseif allValues.iaqIndexAccuracy == BrickletAirQuality.ACCURACY_MEDIUM
        fprintf('IAQ Index Accuracy: Medium\n');
    elseif allValues.iaqIndexAccuracy == BrickletAirQuality.ACCURACY_HIGH
        fprintf('IAQ Index Accuracy: High\n');
    end

    fprintf('Temperature: %g °C\n', allValues.temperature/100.0);
    fprintf('Humidity: %g %%RH\n', allValues.humidity/100.0);
    fprintf('Air Pressure: %g mbar\n', allValues.airPressure/100.0);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
