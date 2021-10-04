#######
### check if a network namespace exists
#######

NETNS=$(ip netns)
if [[ "$NETNS" =~ red ]]; then
	echo "red namespace exists"
fi
