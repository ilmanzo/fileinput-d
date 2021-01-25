import fileinput;
import std.stdio;
import std.string : chomp;

void main(in string[] args)
{
    foreach (line; fileinput.input(args))
    {
        writeln(line.chomp);
    }
    return;
}
