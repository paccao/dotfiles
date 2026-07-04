setxkbmap -layout "se,us" -option caps:swapescape -option grp:win_space_toggle
xrandr --output DisplayPort-0 --mode 3840x2160 --rate 239.91 --scale 1x1 --dpi 163
xrandr --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rotate normal --rate 74.97 --scale 1x1 --dpi 115
exec i3
