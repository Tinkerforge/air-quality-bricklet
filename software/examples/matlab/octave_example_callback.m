function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Air Quality Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    aq = javaObject("com.tinkerforge.BrickletAirQuality", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register all values callback to function cb_all_values
    aq.addAllValuesCallback(@cb_all_values);

    % Set period for all values callback to 1s (1000ms)
    aq.setAllValuesCallbackConfiguration(1000, false);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for all values callback
function cb_all_values(e)
    fprintf("IAQ Index: %d\n", e.iaqIndex);

    if e.iaqIndexAccuracy == 0
        fprintf("IAQ Index Accuracy: Unreliable\n");
    elseif e.iaqIndexAccuracy == 1
        fprintf("IAQ Index Accuracy: Low\n");
    elseif e.iaqIndexAccuracy == 2
        fprintf("IAQ Index Accuracy: Medium\n");
    elseif e.iaqIndexAccuracy == 3
        fprintf("IAQ Index Accuracy: High\n");
    end

    fprintf("Temperature: %g °C\n", e.temperature/100.0);
    fprintf("Humidity: %g %%RH\n", e.humidity/100.0);
    fprintf("Air Pressure: %g hPa\n", e.airPressure/100.0);
    fprintf("\n");
end
