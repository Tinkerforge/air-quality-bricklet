#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_air_quality'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Air Quality Bricklet

ipcon = IPConnection.new # Create IP connection
aq = BrickletAirQuality.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current all values as [iaq_index, iaq_index_accuracy, temperature, humidity,
#                            air_pressure]
all_values = aq.get_all_values

puts "IAQ Index: #{all_values[0]}"

if all_values[1] == BrickletAirQuality::ACCURACY_UNRELIABLE
  puts "IAQ Index Accuracy: Unreliable"
elsif all_values[1] == BrickletAirQuality::ACCURACY_LOW
  puts "IAQ Index Accuracy: Low"
elsif all_values[1] == BrickletAirQuality::ACCURACY_MEDIUM
  puts "IAQ Index Accuracy: Medium"
elsif all_values[1] == BrickletAirQuality::ACCURACY_HIGH
  puts "IAQ Index Accuracy: High"
end

puts "Temperature: #{all_values[2]/100.0} °C"
puts "Humidity: #{all_values[3]/100.0} %RH"
puts "Air Pressure: #{all_values[4]/100.0} hPa"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
