- APA102 / approx 1080 per side
- 5V 60A power supply each side, 4 power injection points per side
- Originally with 5V 60A in the Pixlite 16mk2 feeding power along with data plus powering DJ booth. If you don't have the power move injection points closer to data entry point and it "should" work. (don't go full white and you'll be fine.)
- Powersupplies "should" be currently mounted behind wings and are wired in, 1x 240V piggyback "should" be dangling down each side.
- Wiring is done with Ray Wu waterproof 4 pin, pinout is as follows: (easiest to cut a spare extension cable and make a adapter to go to the LeDMX)
	- Y/G  	+5V
	- Br	Clock
	- Bl 	Data
	- Bk	GND
- Source works for me with processing 3.5.4 on Windows 10
- Currently configured to output Artnet to 192.168.1.201 (Output.pde Line 3)
Output 1:
	Universe	1 thru 6 (Art-Net 00:0:0 – 00:0:5)
	Left Panels: 3, 2, 8, 11, 12, 15
Output 2:
	Universe	7 thru 12 (Art-Net 00:0:6 – 00:0:B)
	Left Panels: 0, 1, 4, 7, 5, 6, 9, 10, 13, 14  
Output 3:
	Universe	13 thru 18 (Art-Net 00:0:C – 00:0:11)
	Right Panels: 3, 2, 8, 11, 12, 15
Output 4:
	Universe	19 thru 24 (Art-Net 00:0:12 – 00:0:17)
	Right Panels: 0, 1, 4, 7, 5, 6, 9, 10, 13, 14  	

