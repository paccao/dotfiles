#/bin/bash

set -e

key_to_press=d

sleep 2

while true; do
	xdotool type --clearmodifiers -- "$key_to_press"
	sleep 2
done
