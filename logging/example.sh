#!/bin/bash

source logging.sh


somefunc() {

set_log_level INFO

log_debug "variable value"

log_info "opeation succeeed"

log_error "something wrong happened"

}

somefunc