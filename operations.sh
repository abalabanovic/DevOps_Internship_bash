#!/bin/bash

OPTSTRING=":o:n:d"

while getopts ${OPTSTRING} opt; do

	case ${opt} in


	d)

		echo "User: $USER"
		echo "Script name : $0"
		echo "Operation : $operation"
		echo "Numbers : ${NUMBERS[@]}"

	;;


	o)

		operation=${OPTARG}

		if [ "$operation" != "+" ] && [ "$operation" != "-" ] && [ "$operation" != "*" ] && [ "$operation" != "/" ];then

			echo "Error:Invalid operations"
			echo "For *, provide '*'"
			exit 1


		fi

		;;
	n)


# GETOPT cant take more arguments in one case but we can move the index

		NUMBERS=()

		NUMBERS+=( "$OPTARG" )

		while [[ $OPTIND -le $# && ${!OPTIND} && ${!OPTIND} != -* ]]; do

		NUMBERS+=( "${!OPTIND}" )
		((OPTIND++))


		done

		;;



	esac

done

		length=${#NUMBERS[@]}
		result=${NUMBERS[0]}
		if [ $length -eq 0 ];then
			echo "No arguments provided"
			exit 1
		fi


		for ((i=1;i<length;i++))
		do

		temp=${NUMBERS[i]}
		let "result=result $operation temp"

		done

		echo "Result is $result"



