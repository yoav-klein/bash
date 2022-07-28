#!/bin/bash


width_conversion() {
    # the - aligns the text to the left
    # the 15 is the width
    printf 'my name is XX%-15sXX\n' "yoav"
}

alignment() {
    printf '%s'
}

print_time() {
    # arguments to time specifies relativity to epoch?
    printf '%(The year is %Y)T\n' 2
    printf '%(The year is %Y)T\n'
}

width_conversion
print_time