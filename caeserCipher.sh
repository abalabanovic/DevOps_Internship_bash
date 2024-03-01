#!/bin/bash

GETSTRING=":s:i:o:"

while getopts ${GETSTRING} opt; do

	case ${opt} in

	s)

		r=${OPTARG}


	;;

	o)

	       output_file=${OPTARG}

	;;

	i)

		input_file=${OPTARG}

		if [ -f $input_file ]
		then

			value=$(<$input_file)


		else

			echo "Input file does not exist!!!"
			exit 1


		fi


	;;

	:)

	echo "Option -${OPTARG} requires an argument."
	exit 1

	;;

	?)

	echo "Invalid option: -${OPTARG}>"
	exit 1
	;;

	esac
done

	#ROTATE LETTERS WITH GIVEN NUMBER OF ROTATION

	a=abcdefghijklmnopqrstuvwxyz
	b=ABCDEFGHIJKLMNOPQRSTUVWXYZ

	if (($r > 26 ));then

		r=$((r % 26))

	fi

	new_text=$(<<< "$value" sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/")

	# PRINT TO A NEW FILE

	echo "$new_text" | sudo tee $output_file

