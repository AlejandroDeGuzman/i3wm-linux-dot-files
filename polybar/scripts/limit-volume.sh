#!/bin/sh

max_volume=100 # Maximum volume in percent

pactl subscribe |
  grep --line-buffered 'sink ' |
  stdbuf -o0 cut -d# -f2 |
  while read index; do
    volume=$(pactl get-sink-volume $index | head -n1 | cut -d/ -f2 | tr -d ' %')
    if ( (volume >max_volume)); then
      pactl set-sink-volume $index $max_volume%
    fi
  done

# not used -> couldn't figure why this script wont work in this location, but it works in ~.
