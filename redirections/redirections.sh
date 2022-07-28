#!/bin/bash

simple_stdout() {
    # let's start with a simple redirection of stdout
    # this will create the "log.txt" file

    echo "ERROR: something happended" > log.txt

}

appending() {
    # appending to a file is done with >>
    echo "ERROR: still a probelm" >> log.txt
}

redirection_order() {
    # redirection order is significant
    # remember: redirection is making a copy of the file descriptor

    # this  command generates stderr messages
    #$ ls not_exist_file redirections.sh

    # if we want to redirect stderr to stdout and then all that to a file
    # this will not work
    ls not_exist_file redirections.sh 2>&1 > log.txt
    # this seems counter-intuitive, but remember, redirecting is making a copy of the file descriptor
    # so we make a copy of FD 1 to FD 2, which in this point is still the terminal, 
    # and only then redirect FD 1 to log.txt

    # this will work
    ls not_exist_file redirections.sh > log.txt 2>&1
}

redirection_location() {
    # redirections can be before or after the command

    # may be before
    > log.txt 2>&1 ls not_exist_file redirections.sh 
    echo "===="
    cat log.txt
    
    # may be after
    ls not_exist_file redirections.sh > log.txt 2>&1
    echo "===="
    cat log.txt

    # may be in both
    > log.txt ls not_exist_file redirections.sh 2>&1
    echo "===="
    cat log.txt
}

redirecting_stdout_and_stderr() {
    # this operator allows redirecting both stdout and stderr
    ls not_exist_file redirections.sh &> log.txt
     &> log.txt ls not_exist_file redirections.sh
    
}

duplicating_fds() {
    # the [n]>&word and [n]<&word forms are used to duplicate file descriptors
    # run this
    ls  -lah /proc/${$}/fd >log.txt 2>&1
    # and see that fd 2 points to what fd 1 points to
    cat log.txt

}

# simple
# appending
# redirection_order
# redirection_location
# redirecting_stdout_and_stderr
duplicating_fds
#clean

