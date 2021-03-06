#!/bin/bash
while /bin/true; do
    if ! [ "$(ping -c 1 google.com)" ]; then
        echo "Warning: connection lost at $(date) -- restart" 
        $(notify-send "Warning connection lost at : $(date) --restart")
        aplay notify.wav
        nmcli nm wifi off
        sleep 3
        nmcli nm wifi on
        sleep 40
        if ! [ "$(ping -c 1 google.com)" ]; then
             echo "Waiting for connection going up at $(date)"
             sleep 60
        else 
             echo "Connection on at $(date)" 
        fi
#    else
#        echo "Connection OK on $(date)"
    fi
sleep 60
done
