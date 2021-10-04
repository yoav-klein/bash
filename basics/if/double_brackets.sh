
###########################################
#
#	Demonstration of use of [[ ]]
#
#
##########################################

echo "----- Regular expressions ------------"

if [[ abc =~ ab.* ]]; then
	echo "abc =~ ab.* evaluates to true"
fi

## When you put quotes around parts of the patttern
## it is treated as string, not a regex
if [[ ! abc =~ ab".*" ]]; then
	echo "But abc =~ ab\".*\" is not!"
fi

echo ""
echo "------- Putting the pattern in a variable ---------"
echo ""
echo "-----First, no variable-------"
if [[ Dog =~ [dD]o[vg] ]]; then
	echo "Dog =~ [dD]o[vg]"
fi

echo ""
echo "---------- Now, Variable -------"
PATTERN=[dD]o[vg]
if [[ Dog =~ $PATTERN ]]; then
	echo "Dog =~ \$PATTERN - when the variable is unqoted - it's handled as regex"
fi

echo "-------- Variable quoted -----------"
if [[ ! Dog =~ "$PATTERN" ]]; then
	echo "Dog =~ \"\$PATTERN\" - when the variable is quoted - it's handled as regular string"
fi

