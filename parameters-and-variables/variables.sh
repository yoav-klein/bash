#!/bin/bash

# this function demonstrate the use of namerefs
function print_var()
{
	declare -n var=$1
	echo $var
}

name=yoav
name+=" klein"

echo $name

declare -i salary
salary=25000
echo $salary
salary+=5000
echo $salary

print_var "name"
