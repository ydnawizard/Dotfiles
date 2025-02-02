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

#wal -i ~/pics/wallpaper/lakedocknight2.jpg -s -t
xrandr --output DP-0 --primary --below DP-2 --mode 2560x1440 --rate 239.97
#xrandr --output DP-2 --rotate right --mode 3440x1440 --pos 2560x-1430 --rate 100.00
xrandr --output DP-2 --mode 2560x1440 --rate 165.00
xrandr --output HDMI-0 --above DP-0 --left-of DP-2 --mode 2560x1440 --rate 144.00
xrandr --output HDMI-1 --left-of DP-0 --rotate left --mode 3440x1440 --rate 49.99
wal -i ~/pics/wallpaper/abstract2.jpg
feh --bg-scale ~/pics/wallpaper/abstract2.jpg
#wal -i ~/pics/wallpaper/abstract2.jpg
setsid picom &
xbindkeys
xset s off

exec dwm
