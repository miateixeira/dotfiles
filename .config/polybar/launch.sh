#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
#echo "---" | tee -a /tmp/polybar.log
#polybar my_bar >>/tmp/polybar.log 2>&1 & disown

if type "xrandr"; then
  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
  if [ $count = 2 ]; then
    for m in $outputs; do
      if [ $m = "HDMI1" ]; then
        MONITOR=$m polybar --reload dual_bar &
      elif [ $m = "eDP1" ]; then
        MONITOR=$m polybar --reload only_ws &
      fi
    done
  else
    polybar --reload my_bar &
  fi
else
  polybar --reload my_bar &
fi
