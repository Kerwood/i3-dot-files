#!/bin/bash
UP_DOWN=$1
PERCENT=$2
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po 'Volume:[\sa-z-:0-9]+\/\s+\K[0-9]{1,3}')

if [[ $UP_DOWN == "up" && $VOL -lt 100 ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ +$PERCENT%
elif [[ $UP_DOWN == "down" ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ -$PERCENT%
fi
