#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# swap escape and caps keys
setxkbmap -option ctrl:swapcaps

# turn off x window blacking
xset -dpms
xset s off

# turn off system bell
xset b off

# set variable because of re-parenting (intellij issue)
wmname LG3D

# start panel bar
#polybar bottom &

# start powertop
#$powertop &

# start udiskie for automatic mounting
udiskie &

# turn on dropbox
dropboxd &

# for notifications
# dunst &

# set wallpaper
feh --bg-scale ~/Pictures/NQp8ofd.jpg &

# start compton
compton &

# start redshift
redshift &

# start window manager
#exec i3
exec bspwm
