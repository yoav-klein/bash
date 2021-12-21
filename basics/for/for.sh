#!/bin/bash

declare -a list
list=(one two three)

for number in ${list[@]}; do
	echo $number
done
