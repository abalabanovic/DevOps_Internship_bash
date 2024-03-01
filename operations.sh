#!/bin/bash

OPTSTRING=":o:n:"

while getopts ${OPTSTRING} opt; do

	case ${opt} in

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

OPTIND=1

while getopts ":d:" opt;do

	case $opt in

	d)

		APT=$OPTARG
		echo "you are here"

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



