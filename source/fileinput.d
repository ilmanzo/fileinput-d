module fileinput;
import std.stdio;
import std.conv;
import std.string;

/// implements a custom range that loops over the lines of files
struct FileInputRange
{
public:
	/// constructor	
    this(in string[] args)  
    {
		if (args.length==1) { // when no args, read stdin
			file=std.stdio.stdin;
		}
		else {
			files=args;
        	curfileidx = 1;
        	file = File(files[curfileidx]); 
		}
    }
	/// disable default constructor
 	@disable this();
	/// in the range Interface this signal the end of data 
    bool empty = false;

    // Peeks at the first element
    string front() const @property
    {
        return curline;
    }
    /// consume the first element
    void popFront()
    {
        if (file.readln(buf))
        {
            curline = to!string(buf);
        } else {
			file.close(); // next file
			curfileidx++; 
			if (curfileidx >= files.length) {
				empty = true;
			} else {
				file=File(files[curfileidx]);
			}
        }
    }

private:
	const string[] files;
    string curline;
    char[] buf;
    File file;
	size_t curfileidx;
}

FileInputRange input(in string[] args)
{
    return FileInputRange(args);
}