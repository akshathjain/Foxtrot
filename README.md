# Foxtrot
##### An IoT device designed to ensure that your front door is closed.

### Inspiration
Sometimes I leave my room in a hurry and forget to completely close my door. With many of my prized possessions inside, I would like to know if my door has closed properly when I've left.

### What it does
Foxtrot uses a simple circuit array connected to your front door to determine whether its closed or note. The state of the door can then be fetched using a mobile application.

### How I built it
Foxtrot is built using some simple technologies. The system for detecting the open door is a circuit that is completed when the door is closed and open when the door is open (not yet implemented). The input for the circuit is read by the Pi, witch then process this input, and outputs the status using a Node.js server (the Pi is running NGINX). Then an Android/iOS mobile application communicates with the server (hosted on the Pi) to determine whether or not the door is open, and displays the status on the phone accordingly.

### Challenges I ran into
The hard part with this was getting everything to work together. Since, I didn't know Node or NGINX prior to completing this project (or anything server related), every step involved tremendous amounts of research. This was also my first time working with a Raspberry Pi.

### Accomplishments that I'm proud of
- I managed to build a working prototype (excluding the actual wiring)
- I figured out how to use the Raspberry Pi
- Created a simple server using NGINX and Node.js

### What I learned
- Node
- Raspberry Pi
- Basic Circuitry

### What's next fo Foxtrot
- Add a camera unit to detect when someone enters the room
- Detect who enters the room
- Use facial recognition to ensure that all persons entering the room are authorized
