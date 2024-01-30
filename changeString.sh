#!/bin/bash

echo "Please use quotation mark when providing strings!"

OPTSTRING=":v:s:r:l:u:o:"

while getopts ${OPTSTRING} opt; do

	case ${opt} in

	l)

		#Convert to lower case


		value=$(echo "${OPTARG}" | tr '[A-Z]' '[a-z]')

		;;

	u)

		#Convert to upper case

		value=$(echo "${OPTARG}" | tr '[a-z]' '[A-Z]')

		;;

	r)

		#Reverse text

		value=$(echo ${OPTARG} | rev)

	;;

	v)

		#Change upper to lower and lower to upper

		if echo "${OPTARG}" 1>/dev/null | sed '/[A-Z]/q'; then

			value=$(echo "${OPTARG}" | tr '[A-Z]' '[a-z]')
			echo "$value"

		else

			value=$(echo "${OPTARG}" | tr '[a-z]' '[A-Z]')
			echo "$value"


		fi


	;;

	o)

		output_file=${OPTARG}
		flag_output=1

	;;


esac

done

	if [ "$flag_output" -eq "1" ]
	then

		echo "New text is: "
		echo "$value" | sudo tee $output_file

	fi
