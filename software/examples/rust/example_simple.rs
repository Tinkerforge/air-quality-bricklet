use std::{error::Error, io};

use tinkerforge::{air_quality_bricklet::*, ipconnection::IpConnection};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Air Quality Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let air_quality_bricklet = AirQualityBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    // Get current all values
    let get_all_values_result = air_quality_bricklet.get_all_values().recv()?;

    println!("IAQ Index: {}", get_all_values_result.iaq_index);

    if get_all_values_result.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_UNRELIABLE {
        println!("IAQ Index Accuracy: Unreliable");
    } else if get_all_values_result.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_LOW {
        println!("IAQ Index Accuracy: Low");
    } else if get_all_values_result.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_MEDIUM {
        println!("IAQ Index Accuracy: Medium");
    } else if get_all_values_result.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_HIGH {
        println!("IAQ Index Accuracy: High");
    }

    println!("Temperature: {}{}", get_all_values_result.temperature as f32 / 100.0, " °C");
    println!("Humidity: {}{}", get_all_values_result.humidity as f32 / 100.0, " %RH");
    println!("Air Pressure: {}{}", get_all_values_result.air_pressure as f32 / 100.0, " mbar");

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
