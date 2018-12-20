use std::{error::Error, io};

use tinkerforge::{air_quality_bricklet::*, ip_connection::IpConnection};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Air Quality Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let aq = AirQualityBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Get current all values.
    let all_values = aq.get_all_values().recv()?;

    println!("IAQ Index: {}", all_values.iaq_index);

    if all_values.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_UNRELIABLE {
        println!("IAQ Index Accuracy: Unreliable");
    } else if all_values.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_LOW {
        println!("IAQ Index Accuracy: Low");
    } else if all_values.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_MEDIUM {
        println!("IAQ Index Accuracy: Medium");
    } else if all_values.iaq_index_accuracy == AIR_QUALITY_BRICKLET_ACCURACY_HIGH {
        println!("IAQ Index Accuracy: High");
    }

    println!("Temperature: {} °C", all_values.temperature as f32 / 100.0);
    println!("Humidity: {} %RH", all_values.humidity as f32 / 100.0);
    println!("Air Pressure: {} mbar", all_values.air_pressure as f32 / 100.0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
