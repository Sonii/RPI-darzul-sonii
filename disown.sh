#!/bin/bash

# Run the emulation.sh with a new session
setsid /home/pi/RetroPie/emulation.sh&

# Stop XBMC
service xbmc stop

exit 0
