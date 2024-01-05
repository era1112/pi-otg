#!/bin/bash

# Set pwd and call script
cd /home/pi/Documents/gps/src/multi/multi-sdr-gps-sim/
./gps-sim -e rinex/*.23n -l 45.872887484583444,-77.25631500866021,200 -s now -g 47 -a -d 1800 -v -i -r hackrf --disable-almanac		# 30 min tape, needs daily rinex reloaded
