#!/bin/bash

status=$(tvservice -s | grep HDMI)

if [ -z "$status" ]; then
	tvservice -p	
	tvservice -c "PAL 4:3"
   	fbset -depth 8 && fbset -depth 16
    	eval $@
	tvservice -p
	tvservice -c "PAL 16:9"
   	fbset -depth 8 && fbset -depth 16
else
	tvservice -e "CEA 1"
   	fbset -depth 8 && fbset -depth 16
	eval $@
    	tvservice -p
    	fbset -depth 8 && fbset -depth 16
fi

