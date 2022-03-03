###################################################
#
# This script is aimed to demonstrate the meaning
# and use of the special IFS variable
#
# IFS is a special variable which contains a string, by default <space><tab><newline>
# Each of the characters in this string serves as a delimiter for word splitting
# 
# Word splitting takes place in expansions, such as parameter expansion
# for example:
#   $ var="My name is Yoav" 
#   $ echo $var
#
# When the $var is expanded, word splitting takes place. In this case,
# the string will be split into 4 words, since <spcae>, which is one of the default
# characters in the IFS is prensent between each of "My" "name" "is" "Yoav"
#   
#
###################################################

call_print_num_of_parameters()
{
	# since when $* is not in quotes, it does word splitting
   echo "This will print 4"
   print_num_of_parameters $*
   
   # when in quotes ("$*")  it expands to a single word
   print_num_of_parameters "$*"
}

print_num_of_parameters()
{
  echo "Number of parameters: $#"
}

# in this example, we demonstrate word splitting.
# the $var variable is expanded, and when expanded, it is subject to word splitting.
# since <space> is present between each "My" "name" etc, each of them is split to another word.
var="My name is Yoav"
echo "This will print 4"
print_num_of_parameters $var

# Expanding within double quotes deny word splitting
echo "This will print 1"
print_num_of_parameters "$var"

# Explicit null arguments are retained and passed to commands as empty strings:
echo "This will print 3"
print_num_of_parameters "" "" ""

## However, null arguments resulting from the expansion of parameters with no value are removed:
no_value=
echo "This will be 0"
print_num_of_parameters $no_value $no_value

## But if the expansion happens in double quotes, it's like the first case
echo "This will be 2"
print_num_of_parameters "$no_value" "$no_value"

#
# this will be passed as 1 word ot call_print_num_of_parameters
call_print_num_of_parameters "My name is Yoav"
call_print_num_of_parameters My Name is Yoav
