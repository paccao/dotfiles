#!/usr/bin/sh

ip -o -f inet addr show | awk '/scope global/ {print $4}' | grep 192 | sed -n 1p
