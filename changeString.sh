#!/bin/bash

GETSTRING=":i:r:o"

while getopts ${GETSTRING} opt; do

	case ${opt} in

	i)

		input_file=${OPTARG}

		if [ -f $input_file ]
		then

			value=$(<$input_file)
		else

			echo "Input file does not exist"

		fi
	;;

	o)

		output_file=${OPTARG}
	;;


	r)

		echo "ALOOOOOO"
		value=$(echo "$value" | rev)
		echo "$value"

	;;

	esac

done
