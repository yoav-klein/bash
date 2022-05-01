# getopts
---

`getopts` is a shell built-in to parse positional parameters.

```
getopts <optstring> <name> [arg...]
```

`optstring` is a string representing the allowed options to the script. for example `abc` means
that the options `a` `b` and `c` are allowed. When an option requires an argument, it is denoted by : as such:
`abc:`. In this example, the `c` option requires an argument.

on each call to `getopts`, `name` is initialized with the current option processed. So when we call 
the script: `./script -a -b` - the first call will initialize it to `a`, the second to `b`.


`getopts` initializes the following variables:
- `OPTIND` - The next positional parameter to be parsed. Initialized to 1
when the script runs, and incremented by 1 each call the `getopts`, or by 2 if the 
there is an argument to the option.
- `OPTARG` - when an option requires an argument, `getopts` places the argument into `OPTARG`.

Start by running the `intro.sh` script.

## Error handling
In `getopts` we can have 2 types of errors: not providing a mandatory argument, or providing an unknown option.

### Silent mode
When providing an unknown option, `?` is put into `name` and the unknown option is put into `OPTARG`.
When not providing an argument, `:` is put into `name` and the option is put into `OPTARG`

### Non-silent mode
In this mode, error messages are printed.

When providing an unknown option, `?` is put into `name` and an error message is printed.
When not providing an argument, `?` is put into `name` and `OPTARG` is not set.


Run the `silent.sh` and `non-silent.sh` scripts with wrong arguments.

 
