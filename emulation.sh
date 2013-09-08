#!/bin/bash

sleep 1

# Drop cache memory
echo 3 > /proc/sys/vm/drop_caches

# Catch output video
hdmi=$(tvservice -s | grep HDMI)

	# Composite yellow
if [ -z "$hdmi" ]; then
        #Enable Yellow Composite RCA
        echo "ES : RCA Composite Yellow"
        tvservice -p
        tvservice -c "PAL 16:9"

# HDMI
else
        # Disable HDMI
        echo "ES : Emulation HDMI"
        tvservice -o
        # Enable HDMI
        tvservice -p
fi

# Reset wminput
kill $(pgrep wminput)
wminput -d&


# Launch emulation station in virtual terminal
openvt -ws -- sudo emulationstation

# Drop cache memory
echo 3 > /proc/sys/vm/drop_caches

# Start XBMC
service xbmc start

exit 0

