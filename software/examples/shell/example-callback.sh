#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Air Quality Bricklet

# Handle incoming all values callbacks
tinkerforge dispatch air-quality-bricklet $uid all-values &

# Set period for all values callback to 1s (1000ms)
tinkerforge call air-quality-bricklet $uid set-all-values-callback-configuration 1000 false

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
