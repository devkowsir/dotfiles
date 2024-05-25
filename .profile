# Source the basic config from .zprofile
[ "$Z_PROFILE_HAS_BEEN_SOURCED" != true ] && source $HOME/.zprofile

# xwallpaper --zoom $XDG_CONFIG_HOME/wall.png
# xrdb -merge $XDG_CONFIG_HOME/x11/Xresources
# setxkbmap -option "caps:swapescape"
# xset m 1/1 0
# xset r rate 300 50
# picom --experimental-backend &
# unclutter -b --exclude-root
# transmission-daemon
# locker
# eval "$(ssh-agent -s)"
# dunst &
# killBrowserOnRamShortage
ibus-daemon -rxRd
