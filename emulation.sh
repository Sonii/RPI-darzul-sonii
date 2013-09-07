#!/bin/bash

sleep 1

# Drop cache memory
echo 3 > /proc/sys/vm/drop_caches

hdmi=$(tvservice -s | grep HDMI)

# Test output video
if [ -z "$hdmi" ]; then
        #Enable Yellow Composite RCA
        echo "ES : RCA Composite Yellow"
        tvservice -p
        tvservice -c "PAL 16:9"

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

service xbmc start

exit 0
