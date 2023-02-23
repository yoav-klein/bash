#!/bin/bash


# defining an array be done as such
sauces=("Ketchup" "Thousand Islands" "Barbiq" "Garlic")

# size of an array
echo ${#sauces[@]}

# iterating over the array's elements
# if ${sauces} is not quoted, is is split to each word
# so that Thousand and Islands are split
for sauce in ${sauces[@]}; do
    echo "Next sauce:"
    echo $sauce
done


echo "================="
# if it is quoted, it expands to a word for each element in the 
# array, so that Thousand Islands are one word
for sauce in "${sauces[@]}"; do
    echo "Next sauce:"
    echo $sauce
done

echo "======================"
# if you use "${sauces[*]}" it expands to one word, with 
# the first character in IFS separating between the elements

IFS=":"
for sauce in "${sauces[*]}"; do
    echo "Next sauce:"
    echo $sauce
done
