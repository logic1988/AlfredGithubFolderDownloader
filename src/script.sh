#!/bin/bash

. library.sh

# https://github.com/logic1988/AlfredHiddenFilesToggle/tree/master/doc
# https://github.com/logic1988/AlfredHiddenFilesToggle/tree/master
# https://github.com/logic1988/opencv/tree/2.4

arg=$1

if [[ -z $arg ]]; then
	addResult "" "invalid" "Input was invalid!" "" "images/invalid.png" "yes" "yes"
else
	arr=(${arg//// })
	num=${#arr[@]}
	isvalid=0 
	if [ $num -ge 6 ]; then
		if [ ${arr[0]} = "https:" -a ${arr[1]} = "github.com" -a ${arr[4]} = "tree" ]; then
			if [ ${arr[5]} = "master" ]; then
				old_sub_str="/tree/master"
				new_sub_str="/trunk"
				path="${arg/$old_sub_str/$new_sub_str}"
			else
				old_sub_str="/tree/"${arr[5]}
				new_sub_str="/branches/"${arr[5]}
				path="${arg/$old_sub_str/$new_sub_str}"
			fi
			if [ $arg != $path ]; then 
				isvalid=1
			fi
		fi
	fi

	if [ $isvalid -eq 1 ]; then 
	    addResult "" $path "Input URL was ok!" "" "images/valid.png" "yes" "yes"
	else
	    addResult "" "invalid" "Input URL was invalid!" "" "images/invalid.png" "yes" "yes"
	fi
fi
getXMLResults
exit
