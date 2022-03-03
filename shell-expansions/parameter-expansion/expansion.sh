#!/bin/bash

name=yoav
var=name

# when the first character is the exclamation mark, and the 'var' is not 
# a nameref, it introduces indirection: bash expands `var` and uses this as the new parameter
# so it will expand 'var' to ''name', and then expand 'name'	
echo ${!var}

declare -n ref=name
# but if it is a nameref, this expands to the name of the variable that the nameref referes to
echo ${!ref}

unset name
unset var

### checking if parameter is null or unset
echo "My name is ${name:-yoav}"
name=Eli
echo "My name is ${name:-yoav}"


echo "I live in ${city:=Jerusalem}"
echo "Now the city var is set to ${city}"

#echo "My age is ${age:?Tell us your age}"

echo "Now that city is set: ${city:+only if city is set}"


########

bar=foo
baz=foo

# prints all the variables that matches the pattern
echo ${!ba*}

# when in double quotes, separates them using the first character of IFS
IFS="%"
echo "${!ba*}"


echo "${!ba@}"
