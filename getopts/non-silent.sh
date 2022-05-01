
######################################################3
#
#	Demonstrates a non-silent mode
#
#
################################################33


while getopts "ht:" opt ; do
	case $opt in
	h ) echo "You pressed h"
		;;
	t ) echo "You pressed t, and gave $OPTARG"
		;;
	esac
done
