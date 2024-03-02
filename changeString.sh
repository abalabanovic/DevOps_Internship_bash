#!/bin/bash

FLAGS=":i:o:rluvs:"
file_text=""

while getopts ${FLAGS} opt;do

	case ${opt} in

	i)

		input_file=${OPTARG}

		if [ -f "$input_file" ]
		then
			file_text=$(<"$input_file")
		else
			echo "File does not exist!"
			exit 1

		fi

	;;

	r)

		file_text=$(echo "$file_text" | rev)

	;;

	o)

		output_file=${OPTARG}

	;;

	l)

		file_text=$(echo "$file_text" | tr 'A-Z' 'a-z')
	;;

	u)

		file_text=$(echo "$file_text" | tr 'a-z' 'A-Z')

	;;

	v)

		new_file_text=""

		for (( i=0;i<${#file_text};i++ ))
		do

			#Starting from index $i take length of 1 from file_text
			char="${file_text:$i:1}"

			if [[ "$char" == [A-Z] ]]
			then
				new_file_text+=$(tr 'A-Z' 'a-z' <<< "$char")

			elif [[ "$char" == [a-z] ]]
			then
				new_file_text+=$(tr 'a-z' 'A-Z' <<< "$char")

			else

				new_file_text+="$char"

			fi

		done

		file_text=${new_file_text}
	;;

	s)

			IFS=' ' read -r -a array <<< "$OPTARG"
			original_word=${array[0]}
			change_word=${array[1]}

			output_string=$(sed "s/$original_word/$change_word/g" <<< "$file_text")
			file_text=${output_string}

	;;

	esac
done

	echo "$file_text" | sudo tee "$output_file"


