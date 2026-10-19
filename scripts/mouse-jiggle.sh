#!/bin/bash

# Mouse movement script to prevent system sleep
# Usage: ./mousemove.sh [interval_in_seconds]

INTERVAL=${1:-180}  # Default: 300 seconds (5 minutes)

echo "Starting mouse movement script (interval: ${INTERVAL}s)"

while true; do
    xdotool mousemove_relative 1 0
    sleep 0.1
    xdotool mousemove_relative -- -1 0
    
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Mouse moved"
    
    sleep "$INTERVAL"
done

