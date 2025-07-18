#!/usr/bin/env bash

# Terminate already running Polybar instances
killall -q polybar

# Wait until the Polybar processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

# Launch Polybar (replace 'main' with your actual bar name from config.ini)
polybar main &

echo "Polybar launched: main"
