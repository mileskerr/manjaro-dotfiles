#
#
#--------------------------------------------------------------------------
#
#PUT
#on_song_change_hook = "xdotool key <KEYBIND THAT ACTIVATES THIS SCRIPT>" 
#IN YOUR SPOTIFYD CONFIG
#
#-------------------------------------------------------------------------
#
#

ps -x | cat > /tmp/a.txt

#i had to read a book on regex to write the following line
sed -n '/^[^$]*polybar playing/p'  /tmp/a.txt > /tmp/b.txt
sed 's/^ *//g' /tmp/b.txt > /tmp/c.txt
sed 's/ .*$//' /tmp/c.txt > /tmp/d.txt

n=$( cat /tmp/d.txt | tr '\012' ' ' )




kill $n

polybar playing &


