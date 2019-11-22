#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletAirQuality;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Air Quality Bricklet

# Callback subroutine for all values callback
sub cb_all_values
{
    my ($iaq_index, $iaq_index_accuracy, $temperature, $humidity, $air_pressure) = @_;

    print "IAQ Index: $iaq_index\n";

    if ($iaq_index_accuracy == Tinkerforge::BrickletAirQuality->ACCURACY_UNRELIABLE)
    {
        print "IAQ Index Accuracy: Unreliable\n";
    }
    elsif ($iaq_index_accuracy == Tinkerforge::BrickletAirQuality->ACCURACY_LOW)
    {
        print "IAQ Index Accuracy: Low\n";
    }
    elsif ($iaq_index_accuracy == Tinkerforge::BrickletAirQuality->ACCURACY_MEDIUM)
    {
        print "IAQ Index Accuracy: Medium\n";
    }
    elsif ($iaq_index_accuracy == Tinkerforge::BrickletAirQuality->ACCURACY_HIGH)
    {
        print "IAQ Index Accuracy: High\n";
    }

    print "Temperature: " . $temperature/100.0 . " °C\n";
    print "Humidity: " . $humidity/100.0 . " %RH\n";
    print "Air Pressure: " . $air_pressure/100.0 . " hPa\n";
    print "\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $aq = Tinkerforge::BrickletAirQuality->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register all values callback to subroutine cb_all_values
$aq->register_callback($aq->CALLBACK_ALL_VALUES, 'cb_all_values');

# Set period for all values callback to 1s (1000ms)
$aq->set_all_values_callback_configuration(1000, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
