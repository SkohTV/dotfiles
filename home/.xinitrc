### Disable screen sleeping
xset -dpms
xset s off


### Startup DE/WE

xrandr --output eDP-1-1 --primary --mode 1920x1080

dunst &
picom &

sh ~/dev/scripts/startup.sh &
#sh ~/dev/scripts/randomize-desktop.sh &
#feh ~/.config/wallpapers/67.jpg --bg-fill
sh ~/.config/eww/launch_eww.sh &

spectrwm
