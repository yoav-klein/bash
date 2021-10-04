
####################################################
#
#	Compound if statement - and / or
#
#
####################################################

echo "------------ Using test [ ] command -----------"

echo "--------- Using -a and -o ------------"
if [ "true" -a "true" ]; then
	echo "Simple: both true, using -a"
fi

if [ "true" -o "" ]; then
	echo "Simple: true or false, using -o"
fi

echo ""
if [ "" -a "true" -o "true" ]; then 
	echo "false -a true -o true
since -a has precedence, false -a true evaluates to false, and then this false -o true evaluates to true"
fi

echo ""
echo "Let's change the precedence using ()"
if [ ! "" -a '(' "true" -o "true" ')' ]; then
	echo "false -a ( true -o true )
we grouped the operands around -o so they're evaluated to true, and then
evaluated with -a false = false"
fi


echo ""
echo "------------ Using multiple test commands: [] && [] || [] ---------"

if [ "true" ] && [ "true" ]; then
	echo "Simple [ true ] && [ true ]"
fi


if [ "" ] || [ "true" ]; then
	echo "Simple [ true ] || [ false ]"
fi

if [ "" ] && [ "true" ] || [ "true" ]; then
	echo "[ false ] && [ true ] || [ true ] - evaluates to true"
fi

if ! [ "" ] && { [ "true" ] || [ "true" ]; }; then
	echo "[ false ] && { [ true ] || [ true ] } - evalutaes to false"  
fi

echo ""
echo "---------------- Using [[ ]] --------------------"


echo "--------- Using -a and -o ------------"
if [[ "true" && "true" ]]; then
	echo "Simple: true && false"
fi

if [[ "true" || "" ]]; then
	echo "Simple: true || false"
fi

echo ""
if [[ "" && "true"  || "true" ]]; then 
	echo "false || true && true - evaluates to true"
fi

echo ""
echo "Let's change the precedence using ()"
if [[ ! "" && ("true"  || "true") ]]; then 
	echo "false && ( true || true ) - evaluates to false"
fi

