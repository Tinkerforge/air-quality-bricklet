function octave_example_simple()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Air Quality Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    aq = javaObject("com.tinkerforge.BrickletAirQuality", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current all values
    allValues = aq.getAllValues();

    fprintf("IAQ Index: %d\n", allValues.iaqIndex);

    if allValues.iaqIndexAccuracy == 0
        fprintf("IAQ Index Accuracy: Unreliable\n");
    elseif allValues.iaqIndexAccuracy == 1
        fprintf("IAQ Index Accuracy: Low\n");
    elseif allValues.iaqIndexAccuracy == 2
        fprintf("IAQ Index Accuracy: Medium\n");
    elseif allValues.iaqIndexAccuracy == 3
        fprintf("IAQ Index Accuracy: High\n");
    end

    fprintf("Temperature: %g °C\n", allValues.temperature/100.0);
    fprintf("Humidity: %g %%RH\n", allValues.humidity/100.0);
    fprintf("Air Pressure: %g mbar\n", allValues.airPressure/100.0);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
