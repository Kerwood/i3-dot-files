#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar top-primary 2>&1 | tee -a /tmp/polybar-primary.log & disown

HOME_LEFT=$(xrandr --listmonitors | grep -o 'HDMI-1$')
HOME_RIGHT=$(xrandr --listmonitors | grep -o 'DP-2-3-8$')

if [[ $HOME_LEFT ]]; then polybar $HOME_LEFT 2>&1 | tee -a /tmp/polybar-$HOME_LEFT.log & disown; fi
if [[ $HOME_RIGHT ]]; then polybar $HOME_RIGHT 2>&1 | tee -a /tmp/polybar-$HOME_RIGHT.log & disown; fi

echo "Bars launched..."
