server=$( protonvpn-cli s | grep 'Server:' | sed 's/.* //' )
connect=$( cat /tmp/vpn.txt 2>/dev/null)




if [[ $connect = "connecting" ]]
then
	
	if [[ $server = "" ]]
	then
		echo 'connecting'
	else
		echo 'connected to '$server
	fi
else
	echo 'not connected'
fi
