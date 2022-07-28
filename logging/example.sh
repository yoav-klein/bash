#!/bin/bash

source logging.sh


somefunc() {

set_log_level INFO

log_debug "variable value"

log_info "opeation succeeed"

log_error "something wrong happened"

}

somefunc

print_error "Something wrong happened"
print_success "This is good"
print_title "About to do something"