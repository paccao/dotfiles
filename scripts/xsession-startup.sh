#!/bin/sh
xrandr --output DisplayPort-0 --mode 3840x2160 --rate 239.91 --scale 1x1 --dpi 180
xrandr --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rotate normal --rate 74.97 --scale 1x1 --dpi 100
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

