spt l -p > /tmp/list.txt

sed 's/(.*//' /tmp/list.txt

spt p -p --name "$@" --device "spicy_meatball" > /dev/null

if [ ${?} -eq 0 ]; then
	polybar -r
	killall -q rofi
fi

#if [ -z ${var+x} ]; then
#	exit 0
#fi

