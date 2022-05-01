#!/bin/bash

#################################
#
#	Basic demo of getopts
#	
#	Call this script with the followings:
#	
#	$ intro.sh -b
#	$ intro.sh -b -c
#	$ intro.sh -a Hello -b
#
##################################



# OPTIND is initialized to 1 on each shell script or session
echo "First value of OPTIND: $OPTIND"
echo "----------------------------"

echo "First call to getopts"
if getopts "a:bc" option; then
	echo "option: $option"
	echo "return value: $ret"
	echo "OPTARG: $OPTARG"
	echo "OPTIND: $OPTIND"
else
	echo "getopts returned a non-zero"
fi

echo "------------------------"
echo "Second call to getopts"
if getopts "a:bc" option; then
	echo "option: $option"
	echo "return value: $ret"
	echo "OPTARG: $OPTARG"
	echo "OPTIND: $OPTIND"
else
	echo "getopts returned with non-zero"
fi

echo "Last value of OPTIND: $OPTIND"
