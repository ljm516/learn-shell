#!/bin/sh

if [ "$#" == "0" ]
	then
	echo pass at least on parameter.
	exit 1

fi

while(($#))
	do
		echo you give me $1
		shift
	done