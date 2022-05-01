# getopt
---

`getopt` is used to parse command line options.

We'll explain the `twine.sh` example here.

First, the call to `getopt`
```
options=$(getopt -o u:p:r: --long user:,password:,repository-url: -- "$@")
```

`getopt` can parse short or long options. `-o` is followed by the short options. 
Each option that is followed by a colon `:` receives a mandatory argument. Two colons 
indicates it receives an optional argument.
 
`--long` is followed by the long options. Again, one colon is mandatory argument, two is optional.

What follows the `--` is the actual string to be parsed. We pass `$@` which is all the positional parameters
of the script.

The return value of `getopt` is the list of parameters split by spaces so they can be read
one by one and processed using `shift`. In the end, a `--` is inserted to indicate the end of
command-line options.

So for example:
```
$ ./twine.sh  --user=Yoav --password=123 -rrepository
```

will generate the following string as output:
```
--user 'Yoav' --password '123' -r 'repository' --
```
You see that although you have `=` and the "repository" is not separated from `-r`, `getopt` inserts spaces 
between those so you can then parse it.

Also, non-option parameters are pushed to after the `--`:
```
$ ./twine.sh  --user=Yoav nonoption2 --password=123 -rrepository nonoption2
```
will generate:
```
--user 'Yoav' --password '123' -r 'repository' -- 'nonoption2' 'nonoption2'
```

Now, we want to set these words as positional parameters of our current shell, so we can iterate over them
and use `shift` to push the ones we've iterated over.

This is what the following line does:
```
eval set -- "$options"
```

Actually, I'm not sure that the `eval` command is mandatory here...


Now, we iterate over the positional parameters until `--` is met.

Although we can specify mandatory arguments for options, we can't specify mandatory options with `getopt`.
So what we do is just check if the values are set an non-null.

After this, we can use the positional parameters, which are all the non-option parameters.




