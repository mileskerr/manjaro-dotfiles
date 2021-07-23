#this script generates a list of your playlists for the rofi menu (getting rid of the URI), then plays your selected playlist and kills rofi

spt l -p > /tmp/list.txt

sed 's/(.*//' /tmp/list.txt

#spicy_meatball is the name of my spotifyd playback device. change it to the name of your preffered playback device or just remove it and it should find a device on its own

spt p -p --name "$@" --device "spicy_meatball" > /dev/null

if [ ${?} -eq 0 ]; then
	polybar -r
	killall -q rofi
fi


