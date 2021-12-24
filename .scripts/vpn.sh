
#this script is called when the user wants to connect or disconnect from the vpn.
#it does that, and also sends a message to a text file in tmp which is read by the script polybar uses to check vpn status, so that it can determine if the vpn is currently in the process of connecting (which for some reason protonvpn-cli s doesn't tell you)


server=$( protonvpn-cli s | grep 'Server:' | sed 's/.* //' )

if [[ $server = "" ]]
then
	
	echo "connecting" > /tmp/vpn.txt
	protonvpn-cli c -f
else
	echo "not" > /tmp/vpn.txt
	protonvpn-cli d
fi
