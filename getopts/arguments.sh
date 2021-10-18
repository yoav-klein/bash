############################
#	
#	Demonstrates options with arguments
#
#
###########################


## ###
# 	option that expects argument is appended a : (t:)
#
#	if there's no argument provided, the opt will be set to :
#	so we can catch it in our case
## 
while getopts ":t:" opt; do
  case ${opt} in
    t )
      target=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))
