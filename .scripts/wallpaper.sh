#first argument is wallpaper, second argument is bar color

re='#([a-z,0-9]{6})'

if [[ $1 =~ $re ]]; then
	convert -size 1920x1080 xc:$1 /tmp/wall.png
elif [ -f "$1" ]; then
	convert $1 \
	-resize 1920x1080^ -gravity Center \
	-crop 1920x1080+0+0 +repage /tmp/wall.png
else
	convert -size 1920x1080 xc:'#ffffff' /tmp/wall.png
fi

if [ -z "$2" ]; then
	bar='#000000'
else
	bar=$2
fi


convert /tmp/wall.png -fill "$bar" -draw "rectangle 100,4 1890,29" /tmp/wall.png
hsetroot -cover '/tmp/wall.png'
