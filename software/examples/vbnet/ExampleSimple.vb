Imports System
Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Air Quality Bricklet

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim aq As New BrickletAirQuality(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get current all values
        Dim iaqIndex, temperature, humidity, airPressure As Integer
        Dim iaqIndexAccuracy As Byte

        aq.GetAllValues(iaqIndex, iaqIndexAccuracy, temperature, humidity, airPressure)

        Console.WriteLine("IAQ Index: " + iaqIndex.ToString())

        If iaqIndexAccuracy = BrickletAirQuality.ACCURACY_UNRELIABLE Then
            Console.WriteLine("IAQ Index Accuracy: Unreliable")
        Else If iaqIndexAccuracy = BrickletAirQuality.ACCURACY_LOW Then
            Console.WriteLine("IAQ Index Accuracy: Low")
        Else If iaqIndexAccuracy = BrickletAirQuality.ACCURACY_MEDIUM Then
            Console.WriteLine("IAQ Index Accuracy: Medium")
        Else If iaqIndexAccuracy = BrickletAirQuality.ACCURACY_HIGH Then
            Console.WriteLine("IAQ Index Accuracy: High")
        End If

        Console.WriteLine("Temperature: " + (temperature/100.0).ToString() + " °C")
        Console.WriteLine("Humidity: " + (humidity/100.0).ToString() + " %RH")
        Console.WriteLine("Air Pressure: " + (airPressure/100.0).ToString() + " hPa")

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
