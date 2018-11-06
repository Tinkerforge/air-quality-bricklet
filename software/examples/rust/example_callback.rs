use std::{error::Error, io, thread};
use tinkerforge::{air_quality_bricklet::*, ipconnection::IpConnection};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Air Quality Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let air_quality_bricklet = AirQualityBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    //Create listener for all values events.
    let all_values_listener = air_quality_bricklet.get_all_values_receiver();
    // Spawn thread to handle received events. This thread ends when the air_quality_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in all_values_listener {
            println!("IAQ Index: {}", event.iaq_index);

            if event.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_UNRELIABLE {
                println!("IAQ Index Accuracy: Unreliable");
            } else if event.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_LOW {
                println!("IAQ Index Accuracy: Low");
            } else if event.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_MEDIUM {
                println!("IAQ Index Accuracy: Medium");
            } else if event.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_HIGH {
                println!("IAQ Index Accuracy: High");
            }

            println!("Temperature: {}{}", event.temperature as f32 / 100.0, " °C");
            println!("Humidity: {}{}", event.humidity as f32 / 100.0, " %RH");
            println!("Air Pressure: {}{}", event.air_pressure as f32 / 100.0, " mbar");
            println!();
        }
    });

    // Set period for all values callback to 1s (1000ms)
    air_quality_bricklet.set_all_values_callback_configuration(1000, false);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
