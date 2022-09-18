# Source the basic config from .zprofile
source $HOME/.zprofile

xwallpaper --zoom $XDG_CONFIG_HOME/wall.png
xrdb -merge $XDG_CONFIG_HOME/x11/Xresources
setxkbmap -option "caps:swapescape"
xset m 1/1 0
xset r rate 300 50
picom --experimental-backend &
unclutter -b --exclude-root
transmission-daemon
locker
eval "$(ssh-agent -s)"
dunst &
