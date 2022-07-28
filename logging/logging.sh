#!/bin/bash

# this should be evlolved into a nice logging library in bash
# reference https://github.com/codeforester/base/blob/master/lib/stdlib.sh


## check if already sourced, and return if is
[ $__logger_sourced__ ] && return
__logger_sourced__=1

_init() {
    echo "init"
    declare -gA _log_levels
    declare -i _log_level_set=3 # default
    _log_levels=([FATAL]=0 [ERROR]=1 [WARNING]=2 [INFO]=3 [DEBUG]=4)
}

#######
#
# the function that actually prints the log record
#
#
_print_log() {
    local selected_level=$1; shift
    local log_level
    log_level="${_log_levels[$selected_level]}"
    (( log_level <= _log_level_set )) && {
        printf '%(%Y-%m-%d:%H:%M:%S)T %-7s %s ' -1 "$selected_level" "${BASH_SOURCE[2]}:${FUNCNAME[2]}:${BASH_LINENO[1]}"
        printf '%s\n' "$@"        
    }

}

set_log_level() {
    local selected_level=$1
    if [ -z "$selected_level" ]; then
        echo "Usage: set_log_level <log_level>"
        return 1
    fi
    local level_num="${_log_levels[$selected_level]}"
    
    if [ "$level_num" ]; then
        _log_level_set=$level_num
    else
        echo "Unknown level $selected_level"
        return 1
    fi


}

log_fatal()    { _print_log FATAL   "$@" ;}
log_error()    { _print_log ERROR   "$@" ;}
log_warning()  { _print_log WARNING "$@" ;}
log_info()     { _print_log INFO    "$@" ;}
log_debug()    { _print_log DEBUG   "$@" ;}




_init
