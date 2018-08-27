function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletAirQuality;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Air Quality Bricklet

    ipcon = IPConnection(); % Create IP connection
    aq = handle(BrickletAirQuality(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register all values callback to function cb_all_values
    set(aq, 'AllValuesCallback', @(h, e) cb_all_values(e));

    % Set period for all values callback to 1s (1000ms) without a threshold
    aq.setAllValuesCallbackConfiguration(1000, false, 'x', 0, 0);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for all values callback
function cb_all_values(e)
    fprintf('IAQ Index: %i\n', e.iaqIndex);

    if e.iaqIndexAccuracy == com.tinkerforge.BrickletAirQuality.ACCURACY_UNRELIABLE
        fprintf('IAQ Index Accuracy: Unreliable\n');
    elseif e.iaqIndexAccuracy == com.tinkerforge.BrickletAirQuality.ACCURACY_LOW
        fprintf('IAQ Index Accuracy: Low\n');
    elseif e.iaqIndexAccuracy == com.tinkerforge.BrickletAirQuality.ACCURACY_MEDIUM
        fprintf('IAQ Index Accuracy: Medium\n');
    elseif e.iaqIndexAccuracy == com.tinkerforge.BrickletAirQuality.ACCURACY_HIGH
        fprintf('IAQ Index Accuracy: High\n');
    end

    fprintf('Temperature: %g °C\n', e.temperature/100.0);
    fprintf('Humidity: %g %%RH\n', e.humidity/100.0);
    fprintf('Air Pressure: %g mbar\n', e.airPressure/100.0);
    fprintf('\n');
end
