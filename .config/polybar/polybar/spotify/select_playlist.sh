
pkill dunst

systemctl --user status spotifyd.service > /tmp/stat.txt

if [ $( sed -n '1p' /tmp/stat.txt | sed 's/ .*$//' ) = ○ ]; then
	systemctl --user start spotifyd.service
fi

rofi -show playlist -modi "playlist:~/.config/rofi/playlists.sh"


