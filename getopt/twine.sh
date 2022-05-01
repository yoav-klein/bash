
usage()
{
	echo "Usage: twine.sh <options>
options:
	-u,--user           username
	-p,--password       password 
	-r,--repository-url url of the pypi repository
"
}

options=$(getopt -o u:p:r: --long user:,password:,repository-url: -- "$@")
if [ $? != 0 ]; then  
    echo "Incorrect options provided"
    exit 1
fi

echo "$options"

eval set -- "$options"
while true; do
	case "$1" in
	-u|--user)
		shift; user=$1
		;;
	-p|--password)
		shift; password=$1
		;;
	-r|--repository-url)
		shift; url=$1
		;;
	--)
		shift
		break
		;;
	esac
	shift
done

echo "The received arguments are: "
echo $user $password $url

if [ -z $user ] || [ -z $password ] || [ -z $url ]; then
	usage
	exit 1
fi

echo "$@"


