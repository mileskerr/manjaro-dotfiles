xrandr --setprovideroutputsource -0x1ff NVIDIA-0
xrandr --auto

if [[ $( xrandr | sed -n '/HDMI-0 connected/p' ) != "" ]]; then
	if [[ $( cat /proc/acpi/button/lid/LID/state | sed 's/.* //g' ) == "open" ]]; then
		xrandr --output eDP-1-0 --primary
		xrandr --output HDMI-0 --left-of eDP-1-0
	else
		xrandr --output HDMI-0 --primary
		xrandr --output eDP-1-0 --off
	fi
else
	xrandr --output eDP-1-0 --primary
	xrandr --output HDMI-0 --off
fi

