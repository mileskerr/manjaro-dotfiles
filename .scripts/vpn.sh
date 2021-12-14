server=$( protonvpn-cli s | grep 'Server:' | sed 's/.* //' )

if [[ $server = "" ]]
then
	
	echo "connecting" > /tmp/vpn.txt
	protonvpn-cli c -f
else
	echo "not" > /tmp/vpn.txt
	protonvpn-cli d
fi
