#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar top-primary 2>&1 | tee -a /tmp/polybar-primary.log & disown

if [[ $(xrandr --listmonitors | grep DP-2-3-8 | wc -l) -eq 1 && $(xrandr --listmonitors | grep DP-1-8 | wc -l) -eq 1 ]]; then 
  polybar DP-2-3-8 2>&1 | tee -a /tmp/polybar-DP-2-3-8.log & disown
  polybar DP-1-8 2>&1 | tee -a /tmp/polybar-DP-1-8-2.log & disown
fi

echo "Bars launched..."
