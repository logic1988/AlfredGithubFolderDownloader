#!/bin/bash

#. library.sh

arg=$1

if [[ $arg = "invalid" ]]; then
	echo "Input path was invalid."
else
	cd ~/Downloads
	svn export --quiet ${arg}

	if [ $? -ne 0 ]; then
	    echo "Download failed!"
	else
		arr=(${arg//// })
		num=${#arr[@]}
		out_folder_name=${arr[$num-1]}
	    echo "Download successful: ~/Downloads/"${out_folder_name}
	fi
				
fi
exit