setxkbmap -layout "se,us" -option escape:caps -option caps:escape -option grp:win_space_toggle
xrandr --output DisplayPort-0 --mode 3840x2160 --rate 239.91
xrandr --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rotate right --rate 74.97
exec i3
