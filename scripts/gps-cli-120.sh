#!/bin/bash

# Set pwd and call script
cd /home/pi/Documents/gps/src/multi/multi-sdr-gps-sim/
hackrf_transfer -t /home/pi/Documents/gps/src/gps-sdr-sim/gps-sdr-sim/tapes/paf_loc.bin -f 1575420000 -s 2600000 -a 1 -x 47 		# 120 min tape, needs daily rinex reloaded
