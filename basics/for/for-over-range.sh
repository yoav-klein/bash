#!/bin/bash

######
#
#   sometimes you want to loop over a range of numbers
#   
#   for example, from 1 to 10, or until a number stored in a variable
#
########


echo "=== simple example"

for i in {0..10}; do
    echo $i
done

echo ""
echo ""

echo "=== iterate over a size of an array" 

myarray=(girrafe zebra dog)
arrsize=${#myarray[@]}

for i in $(seq $arrsize); do
    echo $i
done

echo ""
echo ""
echo "=== starting from zero"

for i in $(seq 0 $(( $arrsize-1 )) ); do
    echo $i
done
