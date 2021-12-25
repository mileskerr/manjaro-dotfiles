pkill dunst

state=$( spt playback -f %s )

if [ $state = "▶" ]; then
	notify-send " " "pausing" -u low
elif [ $state = "⏸" ]; then
	notify-send " " "playing" -u low
fi
spt playback -t

#~/.config/polybar/spotify/refresh.sh
#./refresh.sh
