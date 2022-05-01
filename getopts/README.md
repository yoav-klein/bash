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
