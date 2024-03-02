#!/bin/bash

VALUE=0

while :
do

	read -r INPUT

	if [ "$INPUT" -lt 0 ]
	then

		echo "The value must be >0.Please try again!!"
	else

		VALUE=$INPUT
		break;
	fi

done

	if [ "$VALUE" -eq 0 ]
	then

		echo "0"
		exit 0
	fi


	a=0
	b=1

	for ((i=1;i<=VALUE;i++))
	do

	fn=$((a + b))
	a=$b
	b=$fn

	done

	echo "$fn"
