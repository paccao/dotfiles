# The rest of the usual .xsession config is put in a different place to prevent creating a bad loop launching multiple i3 instances since I want to source my "xsession config" when i reload i3.
# Therefore, .xsession only executes i3 here, the rest is put into the i3 config.
setxkbmap -layout "se,us" -option grp:win_space_toggle
exec i3
