
#i have no clue how to do bash scripting, yes, this is probably janky af


function track {
	spt playback -f %t 2>/dev/null
	
}
function artist {
	spt playback -f %a 2>/dev/null
}
function state {
	spt playback -f %s 2>/dev/null
}

#set variables and check if there are any errors
error=0
track=$( track )
if [ ${?} -ne 0 ]; then
	error=1
fi
artist=$( artist )
if [ ${?} -ne 0 ]; then
	error=1
fi
state=$( state )
if [ ${?} -ne 0 ]; then
	error=1
fi


#cutoff excess length, if there are no errors
maxartistlength=14
maxsonglength=24
if [ $error -eq 0 ]; then
	if [ ${#artist} -gt $maxartistlength ]; then
		maxartistlength=$(( $maxartistlength - 2))
		artist="${artist::$maxartistlength}…"
	fi

	if [ ${#track} -gt $maxsonglength ]; then
		maxsonglength=$(( $maxsonglength - 2))
		track="${track::$maxsonglength}…"
	fi
	if [ $state = "▶" ]; then
		state="Now Playing: "
	else
		state="Paused: "
	fi

	message="$state $artist|$track"
else
	message="Spotify Offline"
fi



echo $message
