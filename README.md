# fileinput-d
A D language implementation of [Python's fileinput](https://docs.python.org/3/library/fileinput.html)


## usage

- add to your dub.json:
```
"dependencies": {
        [...other libraries...]
        "fileinput-d": ">=0.0.1",
        [...other libraries...]
    },
```

in your code:

```
import fileinput;
import std.stdio;
import std.string : chomp;

void main(in string[] args)
{
    foreach (line; fileinput.input(args))
    {
        writeln(line.chomp);  // do something with each line
    }
    return;
}
```

