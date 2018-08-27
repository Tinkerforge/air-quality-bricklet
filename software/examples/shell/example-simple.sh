#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Air Quality Bricklet

# Get current all values
tinkerforge call air-quality-bricklet $uid get-all-values
