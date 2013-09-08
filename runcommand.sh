#!/bin/bash

# Catch output video 
status=$(tvservice -s | grep HDMI)

# Composite yellow
if [ -z "$status" ]; then
	# Set resolution to prefered setting
	tvservice -p

# Set resolution to minimum
	tvservice -c "PAL 4:3"
   	fbset -depth 8 && fbset -depth 16

# Execute argument command
    	eval $@

# Set resolution to prefered setting
	tvservice -p

# Set resolution to optimal setting
	tvservice -c "PAL 16:9"
   	fbset -depth 8 && fbset -depth 16

# HDMI
else
# Set resolution to minimum
	tvservice -e "CEA 1"
   	fbset -depth 8 && fbset -depth 16

	eval $@

# Set resolution to prefered setting
    	tvservice -p
    	fbset -depth 8 && fbset -depth 16
fi

