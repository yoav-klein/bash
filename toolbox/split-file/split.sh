#!/bin/bash

usage() {
    echo "$1 <file> <piece_size> [max_num_pieces]"
}

if [ -z "$1" ] || [ -z "$2" ] ; then
    usage $0
    exit 1
fi

file=$1
piece_size=$2

if [ -n "$3" ]; then
    max_pieces=$3
fi

cp $file source

curr_lines_num=$(wc -l source | awk '{print $1}')
num=0
while [ "$curr_lines_num" -gt 0 ]; do
    head -n $piece_size source > "file${num}"
    (( num+=1 ))
    tail -n +$(( piece_size + 1 )) source > tmp
    mv tmp source
    curr_lines_num=$(wc -l source | awk '{print $1}')
done

rm source


