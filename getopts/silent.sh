
######################################################3
#
#	Demonstrates silent mode
#
################################################33

###
# the : in the begginig of the 'optstring'
# means quite errors
###

while getopts ":ht:" opt ; do
	case $opt in
	h ) echo "You pressed h"
		;;
	t ) echo "You pressed t, and gave $OPTARG"
		;;
	\? ) echo "This option $OPTARG is not recognized !"
		;;
	\: ) echo "You pressed $OPTARG, but didn't provide an argument !"
	esac
done

