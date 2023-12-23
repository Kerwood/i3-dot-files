#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch primary bar
polybar top-primary 2>&1 | tee -a /tmp/polybar-primary.log & disown
# polybar DP-2-3-8 2>&1 | tee -a /tmp/polybar-primary.log & disown
# polybar HDMI-1 2>&1 & disown

# AUTORANDR_TERMINALEN=$(autorandr | grep terminalen | grep current)
#
# if [[ $AUTORANDR_TERMINALEN ]]; then
#   HOME_LEFT=$(xrandr --listmonitors | grep -o 'HDMI-1$')
#   if [[ $HOME_LEFT ]]; then polybar $HOME_LEFT 2>&1 | tee -a /tmp/polybar-$HOME_LEFT.log & disown; fi
# fi
#

AUTORANDR_HOME=$(autorandr | grep home-dock | grep current)

if [[ $AUTORANDR_HOME ]]; then
  HOME_LEFT=$(xrandr --listmonitors | grep -o 'DP-2-1$')
  HOME_RIGHT=$(xrandr --listmonitors | grep -o 'DP-2-3-8$')

  if [[ $HOME_LEFT ]]; then polybar $HOME_LEFT 2>&1 | tee -a /tmp/polybar-$HOME_LEFT.log & disown; fi
  if [[ $HOME_RIGHT ]]; then polybar $HOME_RIGHT 2>&1 | tee -a /tmp/polybar-$HOME_RIGHT.log & disown; fi
fi

echo "Bars launched..."
