#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
        xrdb -merge "$userresources"
    fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export MPD_HOST=$HOME/.config/mpd/socket
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec openbox-session 
exec i3
#exec awesome
