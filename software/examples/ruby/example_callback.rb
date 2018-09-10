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

# Register all values callback
aq.register_callback(BrickletAirQuality::CALLBACK_ALL_VALUES) do |iaq_index,
                                                                  iaq_index_accuracy,
                                                                  temperature, humidity,
                                                                  air_pressure|
  puts "IAQ Index: #{iaq_index}"

  if iaq_index_accuracy == BrickletAirQuality::ACCURACY_UNRELIABLE
    puts "IAQ Index Accuracy: Unreliable"
  elsif iaq_index_accuracy == BrickletAirQuality::ACCURACY_LOW
    puts "IAQ Index Accuracy: Low"
  elsif iaq_index_accuracy == BrickletAirQuality::ACCURACY_MEDIUM
    puts "IAQ Index Accuracy: Medium"
  elsif iaq_index_accuracy == BrickletAirQuality::ACCURACY_HIGH
    puts "IAQ Index Accuracy: High"
  end

  puts "Temperature: #{temperature/100.0} °C"
  puts "Humidity: #{humidity/100.0} %RH"
  puts "Air Pressure: #{air_pressure/100.0} mbar"
  puts ''
end

# Set period for all values callback to 1s (1000ms)
aq.set_all_values_callback_configuration 1000, false

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
