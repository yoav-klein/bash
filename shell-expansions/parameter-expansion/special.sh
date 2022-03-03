#!/bin/bash

############
#
#   The $* parameter
#
#	This parameter expands to the positional parameters
#
############

count_parameters()
{
	echo "Num parameters: $#"
}

expand_positional_at()
{
	count_parameters $@
	echo $@
	
	IFS="@#"
	count_parameters "$@"
	echo "$@" 
}

expand_positional_asterik()
{
	# when not in quotes, each 
	# parameter is exapnded to a separate word
	# Those words are then subject to further word splitting
	# that's why "The king" is also separated and the total count is 4
	count_parameters $*
	echo $*
	
	# when expanded in quotes, expanded to a single word
	# with the parameters separated by the IFS first character
	IFS="@#"
	count_parameters "$*"
	echo "$*"
}

expand_positional_asterik Yoav Klein "The King"
echo "------------------------------"
expand_positional_at Yoav Klein "The King"

# name of the shell script
echo "Name of the shell script: $0"

# process ID of the shell
echo "Shell PID: $$"
