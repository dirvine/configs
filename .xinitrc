#!/usr/bin/sh
eval `dbus-launch --sh-syntax --exit-with-session`
# mpd &
# xscreensaver &
eval `gnome-keyring-daemon`  # SSH/GPG agent
/usr/bin/setxkbmap -option caps:ctrl_modifier
exec i3
