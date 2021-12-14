#!/bin/bash

#update configs to apply Xresources color scheme
#original script created by u/KD2NYT


# Target file
target_file=$1

# copy input file to temporary file for black magic fuckery
cp $target_file.in $target_file.tmp

# Grab colors from Xresources
xrdb ~/.Xresources

# Numbered colors
for i in {0..15}; do
    #v=`xrdb -query | awk '/*.color'"$i":'/ { print substr($2,2) }'`
	hex=$( xrdb -query | grep color$i: | awk '{print substr($2,2)}' )
	#echo $v
#	rgb=$( printf "%d,%d,%d\n" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2} )
	eval "sed -i 's/%cl${i}%/0x${hex}/g' $target_file.tmp";
	#eval "sed -i 's/%rcl${i}%/${rgb}/g' $target_file.tmp";
done

#get list of color codes
#a=$( cat ~/.config/alacritty/alacritty.yml.in | awk -F%cl '{ print $2 }' | sed -r '/^\s*$/d' | sed -r 's/%"//g' )

#get number of colors
#b=$( echo "$a" | wc -l )

#iterate over numbered colors:
#re='^[a-z]+$'

#for col in $a
#do
#	if [[ $col =~ $re ]]; then
#		echo ""
#	else
#		echo $col
#	fi
#done


# Named colors
foreground=$( xrdb -query | sed -n '/^\*foreground/p' | awk '{print substr($2,2)}' )
background=$( xrdb -query | sed -n '/^\*background/p' | awk '{print substr($2,2)}' )
#fgrgb=$( printf "%d,%d,%d\n" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2} )
#bgrgb=$( printf "%d,%d,%d\n" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2} )


sed -i "s/%clfg%/0x${foreground}/g" $target_file.tmp
sed -i "s/%clbg%/0x${background}/g" $target_file.tmp
#sed -i "s/%rclfg%/0x${fgrgb}/g" $target_file.tmp
#sed -i "s/%rclbg%/0x${fgrgb}/g" $target_file.tmp
sed -i '1s/^/#THIS FILE IS GENERATED BY A SCRIPT. DO NOT EDIT IT\n/' $target_file.tmp

# Finally, replace target file with our updated one
rm $target_file
mv $target_file.tmp $target_file
