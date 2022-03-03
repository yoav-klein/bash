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
echo "---------------"

count_params()
{
	echo $#
}

bar=foo
baz=foo

# prints all the variables that matches the pattern
# when not in double quotes, word splitting occurs
echo \${!ba*}
echo ${!ba*}
count_params ${!ba*}

# when in double quotes, word splitting doesn't occur
IFS="%"
echo \"\${!ba*}\"
echo "${!ba*}"
count_params "${!ba*}"

# when @ is used
echo \${!ba@}
echo ${!ba@}
count_params ${!ba@}

echo \"\${!ba@}\"
echo "${!ba@}"

count_params "${!ba@}"

##############3
echo "----------------"

declare -A arr
arr[husbend]=yoav
arr[wife]=dikla

echo \${!arr[*]}
echo ${!arr[*]}
count_params ${!arr[*]}


echo \"\${!arr[*]}\"
echo "${!arr[*]}"
count_params "${!arr[*]}"

echo \${!arr[@]}
echo ${!arr[@]}
count_params ${!arr[@]}


echo \"\${!arr[@]}\"
echo "${!arr[@]}"
count_params "${!arr[@]}"

########################
echo "-------------------"

#
# The use of ${parameter#word}
#
# word is expanded to produce a pattern. if the pattern matches the beginning of the expanded value of parameter,
# then the result of the expansion is the expansion with the shortest matching pattern (#) or longest matching pattern (##) deleted
#
#
patt=yo*
var=yoav
echo ${var#${patt}}
echo ${var##${patt}}

