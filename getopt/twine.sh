
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

eval set -- "$options"
while true; do
	case "$1" in
	-u|--user)
		shift; USER=$1
		;;
	-p|--password)
		shift; PASSWORD=$1
		;;
	-r|--repository-url)
		shift; URL=$1
		;;
	--)
		shift
		break
		;;
	esac
	shift
done

echo $USER $PASSWORD $URL

if [ -z $USER ] || [ -z $PASSWORD ] || [ -z $URL ]; then
	usage
	exit 1
fi


