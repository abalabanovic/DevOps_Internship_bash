#!/bin/bash

OPTSTRING=":o:n:d:"

while getopts ${OPTSTRING} opt; do

	case ${opt} in

	d)

		echo "User:$USER"
		echo "Script:$0"
		echo "Operation:$operation"
		echo "Numbers:${NUMBERS[@]}"

		;;


	o)

		operation=${OPTARG}

		;;
	n)

# GETOPT cant take more arguments in one case but we can move the index

		NUMBERS=()

		NUMBERS+=( "$OPTARG" )

		while [[ ${!OPTIND} && ${!OPTIND} != -* ]]; do

		NUMBERS+=( "${!OPTIND}" )
		((OPTIND++))


		done

		;;



	esac

done


		result=0

		length=${#NUMBERS[@]}

		for ((i=0;i<length;i++))
		do

		temp=${NUMBERS[i]}
		let "result1=result1 $operation temp"

		done

		echo "Result is $result1"



