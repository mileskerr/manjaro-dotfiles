#this script generates a list of your playlists for the rofi menu (getting rid of the URI), then plays your selected playlist and kills rofi

spt l -p > /tmp/list.txt

sed 's/(.*//' /tmp/list.txt



spt p -p --name "$@" > /dev/null

if [ ${?} -eq 0 ]; then
	notify-send " " "now playing from playlist: $@" -u low
	polybar -r
	killall -q rofi
fi


