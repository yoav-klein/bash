#!/bin/bash

echo "Positional parameters"

# if not in quotes, each parameter is expanded to another word
echo $*

# if in quotes, it expands to a single word, with a list of all
# positional parameters separated by the first character in the IFS
# special variable
IFS="@#"
echo "$*"

# number of positional parameters
echo "Number of positional parameters $#"

# name of the shell script
echo "Name of the shell script: $0"

# process ID of the shell
echo "Shell PID: $$"
