
######################################################3
#
#	Demonstrates a basic usage of getopts
#
#
################################################33

###
# the : in the begginig of the 'optstring'
# means quite errors
###

while getopts ":ht" opt ; do
	case $opt in
	h ) echo "You pressed h"
		;;
	t ) echo "You pressed t"
		;;
	\? ) echo "Usage: basic.sh [-t] [-h]"
		;;
	esac
	echo "OPTIND: $OPTIND"
done

echo "First before shift: $1"

## It is good practice to shift left (effectively remove) 
# the already-processed arguments
shift $(( OPTIND-1 ))
echo "Now: $1"
