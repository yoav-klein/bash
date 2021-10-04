
############################################
#	
#	Demonstration of uses of if statement in bash
#
############################################


echo "------- Test based on an external command -----------"
if ./zero.out; then
	echo "The executable returned a zero status"
fi

echo "****************************************"

echo "-------- Test based on the test [ ]  builtin ----------"
echo "-------------------------------------------------------"
echo ""
echo "-------- Use one argument ---------"
if [ "non-null value" ]; then
	echo "test built-in got a one non-null argument"
fi

echo ""
echo "-------- Use two arguments ---------"
if [ ! "non-null value" ]; then
	echo "This won't execute"
else
	echo "negation of non-null value"
fi

if [ -n "some string" ]; then
	echo "unary operator: -n 'some string'"
fi

echo ""
echo "------ Use three arguments -------"
if [ "Value" == "Value" ]; then
	echo "binary operator: Value == Value"
fi 

if [ ! -z "some string" ]; then
	echo "negation of two argument expression: ! -z 'some string'"
fi

if [ '(' "non-null" ')' ]; then
	echo "use '(' and ')': '(' \"non-null\" ')'"
fi 

echo ""
echo "-------- Use of four arguments -------"
if [ -n "some string" -a "non-null" ]; then
	echo "precedence"
fi

if [ ! "One" == "Two" ]; then
	echo "negation of 3 arguments: ! \"One\" == \"Two\""
fi

echo ""
echo "---------- Use of five arguments --------"
if [ "One" == "Two" -o "non-null" ]; then
	echo "\"One\" == \"Two\" -o \"non-null\""
fi 

echo ""
echo "-------------------------------------------"
echo "--------- Combination operators -----------"
echo "-------------------------------------------"
echo ""
echo "---------- negation: ! ------------"
if [ ! "" ]; then
	echo "neaget a null string: ! \"\""
fi 

echo "-------- paranthesis: ( ) ----------"
if [ '(' "some value" ')' ]; then
	echo "'(' \"some value\" ')'"
fi

echo "---------- AND : -a ---------"
if [ "Two" == "Two" -a "One" == "One" ]; then
	echo "\"Two\" == \"Two\" -a \"One\" == \"One\""
fi

echo "---------- OR: -o ------------"
if [ "One" == "One" -o "One" == "Two" ]; then
	echo "\"One\" == \"Two\" -a \"One\" == \"One\""
fi

echo ""
echo "**************************************************************"
echo "********* Operators (described in the reference in **********"
echo "**********6.4 - Bash Conditional Expressions ****************"
echo "*************************************************************"

echo ""
echo "------- Unary operators --------"
echo ""
echo "------ if file exists ---------"
if [ -e "use_if.sh" -a -e "folder" ]; then
	echo "using -e to check if file exists - regular or directory"
	echo "use_if.sh and folder exist !"
fi

echo ""
echo "------ if directory exists -------"
if [ -d "folder" ]; then
	echo "using -d to check if file exists and is directory"
	echo "folder exists !"
fi

echo ""
echo "------ if file exists and is regular -------"
if [ -f "use_if.sh" -a -f "folder" ]; then
	echo "This will not execute since folder is not a regular file"
elif [ -f "use_if.sh" -a ! -f "folder" ]; then
	echo "-f \"use_if.sh\" -a ! -f \"folder\""
fi

echo ""
echo "-------- if a length of string is zero -------"
if [ -z "" ]; then
	echo " -z \"\""
fi

echo ""
echo "--------- if a length of string is non-zero --------"
if [ -n "some string" ]; then
	echo " -n \"some strgin\""
fi

echo ""
echo "----- Binary operators -------"
echo ""
echo "------ if strings are equal --------"
if [ "value" == "value" ]; then
	echo "\"value\" == \"value\""
fi

echo ""
echo "------- if strings are not equal --------"
if [ "One" != "Two" ]; then
	echo "\"One\" != \"Two\""
fi

