#/bin/bash


################
#
#	Check if a variable exists
#
#	often you need to check if a variable is set e.g. an environment variable
#	
##################

# notice that if you don't quote
if [ -n $NONEXISTING ]; then
	echo "Unqoted non-existing variable"
fi

# however, if you quote it
if [ -n "$NONEXISTING" ]; then
	echo "Wont print this"
else
	echo "Quoted is empty"
fi

# however, most examples use the negation of -z
# note that in this case you don't need to quote
if [ ! -z $NONEXISTING ]; then
	echo "negation of -z works fine"
fi

