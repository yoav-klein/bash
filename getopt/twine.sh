
usage()
{
	echo "Usage: twine.sh -u|--user <user> -p|--password <password> --repository-url <repo-url>"

}

options=$(getopt -o u:p: --long user:,password:,repository-url: -- "$@")
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
	--repository-url)
		shift; URL=$1
		;;
	--)
		shift
		break
		;;
	esac
	shift
done

if [ -z $USER ] || [ -z $PASSWORD ] || [ -z $URL ]; then
	usage
	exit 1
fi


