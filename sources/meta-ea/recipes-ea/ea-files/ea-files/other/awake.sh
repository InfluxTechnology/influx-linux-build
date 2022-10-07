#!/bin/bash

if [ "${1}" == "pre" ]; then
#	sh /path/to/script/to/run.sh
	echo "pre *&*&*&*&*&"
	echo "pre %^%^%^%^%^" > /home/root/pre.txt
elif [ "${1}" == "post" ]; then
	# nothing goes here
	echo "post *&*&*&*&*&"
	echo "post %^%^%^%^%^" > /home/root/post.txt
fi