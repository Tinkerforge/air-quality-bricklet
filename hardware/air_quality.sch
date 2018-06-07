EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "VOC Bricklet"
Date "2018-01-08"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2017, L.Lauer <lukas@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L DRILL U103
U 1 1 4C6050A5
P 10650 6150
F 0 "U103" H 10700 6200 60  0001 C CNN
F 1 "DRILL" H 10650 6150 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6150 60  0001 C CNN
F 3 "" H 10650 6150 60  0001 C CNN
	1    10650 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U104
U 1 1 4C6050A2
P 10650 6350
F 0 "U104" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0001 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U106
U 1 1 4C60509F
P 11000 6350
F 0 "U106" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U105
U 1 1 4C605099
P 11000 6150
F 0 "U105" H 11050 6200 60  0001 C CNN
F 1 "DRILL" H 11000 6150 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6150 60  0001 C CNN
F 3 "" H 11000 6150 60  0001 C CNN
	1    11000 6150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR01
U 1 1 4C5FCFB4
P 2700 1000
F 0 "#PWR01" H 2700 1100 30  0001 C CNN
F 1 "VCC" H 2700 1100 30  0000 C CNN
F 2 "" H 2700 1000 60  0001 C CNN
F 3 "" H 2700 1000 60  0001 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 4C5FCF4F
P 1300 2500
F 0 "#PWR02" H 1300 2500 30  0001 C CNN
F 1 "GND" H 1300 2430 30  0001 C CNN
F 2 "" H 1300 2500 60  0001 C CNN
F 3 "" H 1300 2500 60  0001 C CNN
	1    1300 2500
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR2 P101
U 1 1 4C5FCF27
P 1300 1950
F 0 "P101" H 1450 2350 60  0000 C CNN
F 1 "CON-SENSOR2" V 1450 1950 60  0000 C CNN
F 2 "CON-SENSOR2" H 1300 1950 60  0001 C CNN
F 3 "" H 1300 1950 60  0001 C CNN
	1    1300 1950
	-1   0    0    -1  
$EndComp
$Comp
L C C101
U 1 1 54F76B96
P 1900 1350
F 0 "C101" V 2000 1500 50  0000 L CNN
F 1 "10uF" V 1750 1350 50  0000 L CNN
F 2 "C0805" H 1900 1350 60  0001 C CNN
F 3 "" H 1900 1350 60  0001 C CNN
	1    1900 1350
	-1   0    0    1   
$EndComp
$Comp
L C C103
U 1 1 54F77AA5
P 2700 1350
F 0 "C103" V 2800 1500 50  0000 L CNN
F 1 "1uF" V 2550 1350 50  0000 L CNN
F 2 "C0603F" H 2700 1350 60  0001 C CNN
F 3 "" H 2700 1350 60  0001 C CNN
	1    2700 1350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 54F77AEA
P 2700 1800
F 0 "#PWR03" H 2700 1800 30  0001 C CNN
F 1 "GND" H 2700 1730 30  0001 C CNN
F 2 "" H 2700 1800 60  0001 C CNN
F 3 "" H 2700 1800 60  0001 C CNN
	1    2700 1800
	1    0    0    -1  
$EndComp
$Comp
L C C104
U 1 1 5820FDE6
P 4700 5950
F 0 "C104" V 4750 5700 50  0000 L CNN
F 1 "100nF" V 4550 5850 50  0000 L CNN
F 2 "C0603F" H 4700 5950 60  0001 C CNN
F 3 "" H 4700 5950 60  0001 C CNN
	1    4700 5950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 5821096B
P 4700 6500
F 0 "#PWR04" H 4700 6600 30  0001 C CNN
F 1 "VCC" H 4700 6600 30  0000 C CNN
F 2 "" H 4700 6500 60  0001 C CNN
F 3 "" H 4700 6500 60  0001 C CNN
	1    4700 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58210C80
P 4700 7200
F 0 "#PWR05" H 4700 7200 30  0001 C CNN
F 1 "GND" H 4700 7130 30  0001 C CNN
F 2 "" H 4700 7200 60  0001 C CNN
F 3 "" H 4700 7200 60  0001 C CNN
	1    4700 7200
	1    0    0    -1  
$EndComp
Text GLabel 3000 1950 2    60   Output ~ 0
S-CS
Text GLabel 3000 2050 2    60   Output ~ 0
S-CLK
Text GLabel 3000 2150 2    60   Output ~ 0
S-MOSI
Text GLabel 3000 2250 2    60   Input ~ 0
S-MISO
$Comp
L LED D101
U 1 1 5823347E
P 3600 4000
F 0 "D101" H 3600 4100 50  0000 C CNN
F 1 "blue" H 3600 3900 50  0000 C CNN
F 2 "D0603E" H 3600 4000 50  0001 C CNN
F 3 "" H 3600 4000 50  0000 C CNN
	1    3600 4000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P103
U 1 1 58233528
P 6650 4300
F 0 "P103" H 6650 4450 50  0000 C CNN
F 1 "BOOT" V 6750 4300 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 6650 4200 50  0001 C CNN
F 3 "" H 6650 4200 50  0000 C CNN
	1    6650 4300
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR06
U 1 1 5824794E
P 3350 3950
F 0 "#PWR06" H 3350 4050 30  0001 C CNN
F 1 "VCC" H 3350 4050 30  0000 C CNN
F 2 "" H 3350 3950 60  0001 C CNN
F 3 "" H 3350 3950 60  0001 C CNN
	1    3350 3950
	1    0    0    -1  
$EndComp
Text Notes 2950 5150 0    39   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
$Comp
L R R101
U 1 1 5898C45C
P 4150 4000
F 0 "R101" V 4230 4000 50  0000 C CNN
F 1 "1k" V 4150 4000 50  0000 C CNN
F 2 "R0603F" H 4150 4000 60  0001 C CNN
F 3 "" H 4150 4000 60  0000 C CNN
	1    4150 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 2500 1300 2400
Wire Wire Line
	1750 1100 2700 1100
Wire Wire Line
	1750 1850 1750 1100
Wire Wire Line
	1900 1100 1900 1150
Connection ~ 1900 1100
Wire Wire Line
	1650 1950 2050 1950
Wire Wire Line
	1650 2050 2050 2050
Wire Wire Line
	1650 2150 2050 2150
Wire Wire Line
	1650 2250 2050 2250
Wire Wire Line
	1650 1850 1750 1850
Wire Wire Line
	3900 4000 3800 4000
Wire Wire Line
	3400 4000 3350 4000
Wire Wire Line
	3350 4000 3350 3950
Wire Wire Line
	1650 1750 2700 1750
Wire Wire Line
	1900 1550 1900 1750
Connection ~ 1900 1750
Wire Wire Line
	2700 1550 2700 1800
Connection ~ 2700 1750
Wire Wire Line
	2700 1000 2700 1150
Connection ~ 2700 1100
Wire Wire Line
	4400 4900 4600 4900
Wire Wire Line
	4400 5000 4600 5000
Wire Wire Line
	4400 5100 4600 5100
$Comp
L GND #PWR07
U 1 1 5828358D
P 6900 4400
F 0 "#PWR07" H 6900 4400 30  0001 C CNN
F 1 "GND" H 6900 4330 30  0001 C CNN
F 2 "" H 6900 4400 60  0001 C CNN
F 3 "" H 6900 4400 60  0001 C CNN
	1    6900 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4350 6900 4400
Wire Wire Line
	2450 1950 3000 1950
Wire Wire Line
	3000 2050 2450 2050
Wire Wire Line
	2450 2150 3000 2150
Wire Wire Line
	3000 2250 2450 2250
Text GLabel 4400 4900 0    47   Input ~ 0
S-CS
Text GLabel 4400 5000 0    47   Input ~ 0
S-CLK
Text GLabel 4400 5100 0    47   Input ~ 0
S-MOSI
Text GLabel 6850 3850 0    47   Output ~ 0
S-MISO
$Comp
L GND #PWR08
U 1 1 59006077
P 1950 2700
F 0 "#PWR08" H 1950 2700 30  0001 C CNN
F 1 "GND" H 1950 2630 30  0001 C CNN
F 2 "" H 1950 2700 60  0001 C CNN
F 3 "" H 1950 2700 60  0001 C CNN
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR09
U 1 1 59008D94
P 1650 1000
F 0 "#PWR09" H 1650 850 50  0001 C CNN
F 1 "+5V" H 1650 1140 50  0000 C CNN
F 2 "" H 1650 1000 50  0000 C CNN
F 3 "" H 1650 1000 50  0000 C CNN
	1    1650 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1650 1650 1000
$Comp
L VCC #PWR010
U 1 1 590215C3
P 10250 1150
F 0 "#PWR010" H 10250 1250 30  0001 C CNN
F 1 "VCC" H 10250 1250 30  0000 C CNN
F 2 "" H 10250 1150 60  0001 C CNN
F 3 "" H 10250 1150 60  0001 C CNN
	1    10250 1150
	1    0    0    -1  
$EndComp
$Comp
L C C105
U 1 1 59021733
P 10700 1550
F 0 "C105" V 10750 1600 50  0000 L CNN
F 1 "100nF" V 10650 1600 50  0000 L CNN
F 2 "C0603F" H 10700 1550 60  0001 C CNN
F 3 "" H 10700 1550 60  0001 C CNN
	1    10700 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 59021CF7
P 10200 2500
F 0 "#PWR011" H 10200 2500 30  0001 C CNN
F 1 "GND" H 10200 2430 30  0001 C CNN
F 2 "" H 10200 2500 60  0001 C CNN
F 3 "" H 10200 2500 60  0001 C CNN
	1    10200 2500
	1    0    0    -1  
$EndComp
Text GLabel 4400 4400 0    47   Output ~ 0
M-CLK
Text GLabel 4400 4500 0    47   Output ~ 0
M-CS
$Comp
L R_PACK4 RP101
U 1 1 590B3692
P 2250 2300
F 0 "RP101" H 2250 2750 50  0000 C CNN
F 1 "82" H 2250 2250 50  0000 C CNN
F 2 "4X0402" H 2250 2300 50  0001 C CNN
F 3 "" H 2250 2300 50  0000 C CNN
	1    2250 2300
	1    0    0    -1  
$EndComp
$Comp
L C C102
U 1 1 590B3753
P 1950 2450
F 0 "C102" V 2050 2600 50  0000 L CNN
F 1 "220pF" V 1800 2450 50  0000 L CNN
F 2 "C0402E" H 1950 2450 60  0001 C CNN
F 3 "" H 1950 2450 60  0001 C CNN
	1    1950 2450
	-1   0    0    1   
$EndComp
Connection ~ 1950 2250
Wire Wire Line
	1950 2650 1950 2700
Text Notes 2950 4500 0    39   ~ 0
SPI Master\nP0.6 : CH1-DX0 : MISO\nP0.7 : CH1-DOUT : MOSI\nP0.8 : CH1-SCLKOUT : CLK\nP0.9 : CH1-SELO0 : SEL\n
$Comp
L CONN_01X01 P102
U 1 1 590B4637
P 6650 4850
F 0 "P102" H 6600 4750 50  0000 C CNN
F 1 "DEBUG" V 6750 4850 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 6650 4850 50  0001 C CNN
F 3 "" H 6650 4850 50  0000 C CNN
	1    6650 4850
	-1   0    0    1   
$EndComp
Text GLabel 4400 4300 0    47   Output ~ 0
M-MOSI
Text GLabel 4400 4200 0    47   Input ~ 0
M-MISO
Wire Wire Line
	4400 4200 4600 4200
Wire Wire Line
	4400 4300 4600 4300
Wire Wire Line
	4400 4400 4600 4400
Wire Wire Line
	4400 4500 4600 4500
Text GLabel 9250 2100 0    47   Input ~ 0
M-CLK
Text GLabel 9250 2300 0    47   Input ~ 0
M-CS
Text GLabel 9250 2200 0    47   Input ~ 0
M-MOSI
Text GLabel 9250 2000 0    47   Output ~ 0
M-MISO
$Comp
L BME680 U1
U 1 1 5A09E7CA
P 9800 2150
F 0 "U1" H 9550 2450 60  0000 C CNN
F 1 "BME680" H 9800 1850 60  0000 C CNN
F 2 "BME680" H 9800 2150 60  0001 C CNN
F 3 "" H 9800 2150 60  0000 C CNN
	1    9800 2150
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5A09F217
P 10950 1550
F 0 "C1" V 11000 1600 50  0000 L CNN
F 1 "100nF" V 10900 1600 50  0000 L CNN
F 2 "C0603F" H 10950 1550 60  0001 C CNN
F 3 "" H 10950 1550 60  0001 C CNN
	1    10950 1550
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 5A09F7BD
P 10500 1150
F 0 "#PWR012" H 10500 1250 30  0001 C CNN
F 1 "VCC" H 10500 1250 30  0000 C CNN
F 2 "" H 10500 1150 60  0001 C CNN
F 3 "" H 10500 1150 60  0001 C CNN
	1    10500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 2000 10250 2000
Wire Wire Line
	10150 2100 10500 2100
Wire Wire Line
	10150 2200 10200 2200
Wire Wire Line
	10200 2200 10200 2500
Wire Wire Line
	10150 2300 10200 2300
Connection ~ 10200 2300
Wire Wire Line
	9450 2000 9250 2000
Wire Wire Line
	9250 2100 9450 2100
Wire Wire Line
	9450 2200 9250 2200
Wire Wire Line
	9450 2300 9250 2300
$Comp
L XMC1XXX48 U2
U 1 1 5A4E0D04
P 5200 6350
F 0 "U2" H 5050 7300 60  0000 C CNN
F 1 "XMC1XXX48" H 5200 5400 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 5350 6600 60  0001 C CNN
F 3 "" H 5350 6600 60  0000 C CNN
	1    5200 6350
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U2
U 2 1 5A4E0DBD
P 4950 4350
F 0 "U2" H 5050 5300 60  0000 C CNN
F 1 "XMC1XXX48" H 5250 3400 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 5100 4600 60  0001 C CNN
F 3 "" H 5100 4600 60  0000 C CNN
	2    4950 4350
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U2
U 3 1 5A4E0E16
P 7400 3000
F 0 "U2" H 7250 3500 60  0000 C CNN
F 1 "XMC1XXX48" H 7400 2500 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 7550 3250 60  0001 C CNN
F 3 "" H 7550 3250 60  0000 C CNN
	3    7400 3000
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U2
U 4 1 5A4E0E79
P 7400 4350
F 0 "U2" H 7250 5000 60  0000 C CNN
F 1 "XMC1XXX48" H 7400 3400 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 7550 4600 60  0001 C CNN
F 3 "" H 7550 4600 60  0000 C CNN
	4    7400 4350
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U2
U 5 1 5A4E0EDE
P 5200 2650
F 0 "U2" H 5050 3100 60  0000 C CNN
F 1 "XMC1XXX48" H 5200 2100 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 5350 2900 60  0001 C CNN
F 3 "" H 5350 2900 60  0000 C CNN
	5    5200 2650
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5A4E2722
P 4350 5950
F 0 "C2" V 4400 5700 50  0000 L CNN
F 1 "100nF" V 4200 5850 50  0000 L CNN
F 2 "C0603F" H 4350 5950 60  0001 C CNN
F 3 "" H 4350 5950 60  0001 C CNN
	1    4350 5950
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5A4E282B
P 4700 6900
F 0 "C3" V 4750 6650 50  0000 L CNN
F 1 "100nF" V 4550 6800 50  0000 L CNN
F 2 "C0603F" H 4700 6900 60  0001 C CNN
F 3 "" H 4700 6900 60  0001 C CNN
	1    4700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5700 4350 5700
Wire Wire Line
	4350 5550 4350 5750
Connection ~ 4350 5700
Wire Wire Line
	4700 7100 4700 7200
$Comp
L GND #PWR013
U 1 1 5A4E2EBF
P 4350 6250
F 0 "#PWR013" H 4350 6250 30  0001 C CNN
F 1 "GND" H 4350 6180 30  0001 C CNN
F 2 "" H 4350 6250 60  0001 C CNN
F 3 "" H 4350 6250 60  0001 C CNN
	1    4350 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6500 4700 6700
Wire Wire Line
	4700 5750 4700 5700
Connection ~ 4700 5700
Wire Wire Line
	4850 5600 4350 5600
Connection ~ 4350 5600
$Comp
L VCC #PWR014
U 1 1 5A4E3F21
P 4350 5550
F 0 "#PWR014" H 4350 5650 30  0001 C CNN
F 1 "VCC" H 4350 5650 30  0000 C CNN
F 2 "" H 4350 5550 60  0001 C CNN
F 3 "" H 4350 5550 60  0001 C CNN
	1    4350 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6200 4850 6200
Wire Wire Line
	4700 6300 4850 6300
Wire Wire Line
	4700 6150 4700 6300
Connection ~ 4700 6200
Wire Wire Line
	4350 6150 4350 6250
Connection ~ 4350 6200
NoConn ~ 4850 3050
NoConn ~ 4850 2950
Wire Wire Line
	6850 4250 7050 4250
Wire Wire Line
	6850 4350 6900 4350
Wire Wire Line
	7050 3850 6850 3850
NoConn ~ 7050 4050
NoConn ~ 7050 4150
NoConn ~ 7050 4350
NoConn ~ 7050 4450
NoConn ~ 4600 4800
NoConn ~ 4600 4700
NoConn ~ 4600 4600
NoConn ~ 4600 4100
NoConn ~ 4600 3900
NoConn ~ 4600 3800
NoConn ~ 4600 3700
NoConn ~ 4600 3600
NoConn ~ 4850 2850
NoConn ~ 4850 2750
NoConn ~ 4850 2350
NoConn ~ 7050 3300
NoConn ~ 7050 3100
NoConn ~ 7050 3000
NoConn ~ 7050 2900
NoConn ~ 7050 2800
NoConn ~ 7050 2700
NoConn ~ 7050 5150
NoConn ~ 7050 5050
NoConn ~ 7050 4950
NoConn ~ 7050 4750
NoConn ~ 7050 4650
NoConn ~ 7050 4550
NoConn ~ 7050 3950
Wire Wire Line
	4600 4000 4400 4000
NoConn ~ 7050 3200
Wire Wire Line
	7050 4850 6850 4850
Wire Wire Line
	4850 6550 4700 6550
Connection ~ 4700 6550
Wire Wire Line
	4850 6650 4700 6650
Connection ~ 4700 6650
Wire Wire Line
	4700 7150 4850 7150
Connection ~ 4700 7150
$Comp
L GND #PWR?
U 1 1 5B18F010
P 10700 1850
F 0 "#PWR?" H 10700 1850 30  0001 C CNN
F 1 "GND" H 10700 1780 30  0001 C CNN
F 2 "" H 10700 1850 60  0001 C CNN
F 3 "" H 10700 1850 60  0001 C CNN
	1    10700 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B18F07F
P 10950 1850
F 0 "#PWR?" H 10950 1850 30  0001 C CNN
F 1 "GND" H 10950 1780 30  0001 C CNN
F 2 "" H 10950 1850 60  0001 C CNN
F 3 "" H 10950 1850 60  0001 C CNN
	1    10950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2000 10250 1150
Wire Wire Line
	10500 2100 10500 1150
Wire Wire Line
	10700 1350 10700 1250
Wire Wire Line
	10700 1250 10250 1250
Connection ~ 10250 1250
Wire Wire Line
	10500 1200 10950 1200
Wire Wire Line
	10950 1200 10950 1350
Connection ~ 10500 1200
Wire Wire Line
	10700 1750 10700 1850
Wire Wire Line
	10950 1750 10950 1850
$EndSCHEMATC
