case $1 in
	-h | --help)
		echo "idk bro"
		;;
	-f | --file)
		files=$2
		output=$3
		;;
	-d | --directory)
		files=$( ls -p | grep -v / )
		output=$2
		;;
	*)
		echo "specify --file (-f) or --directory (-d)"
		;;
esac


if [[ $output == '' ]]
then
	echo "specify output path"
else
	for file in $files
	do
		origin=$( pwd | sed 's/\/home\/milo/\/home\/milo\/dotfiles/' )	
	
		echo $'\n' \
		'[[files]]'$'\n' \
		'name = "'$file'"'$'\n' \
		'origin = "'$origin'/$file"'$'\n' \
		'deployed = \"'$( pwd )'/'$file'"' \
		|sed 's/^ //' >> $output
	done
fi
