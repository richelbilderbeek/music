# "Friday"

'"Friday"' (note the quotation marks) is an
improvement of Rebecca Black's 'Friday' (note no quotation marks).
Although I do like the original, I have read all critiques on it and
implemented those.

- [![PlayOgg](http://static.fsf.org/playogg/Play_ogg_80x15.png "I support PlayOgg!")](http://playogg.org)
  [Download the OGG of '"Friday"' (recorded on the 12th of August of 2011)](http://www.richelbilderbeek.nl/CD07_Friday20110812.ogg)
- [View the sheet music of 'Friday' (ps)](54_friday.ps)
- [View the sheet music of 'Friday' (png)](54_friday.png)
- [View the ABC notation file of '"Friday"'](54_friday.abc)
- [Download the MIDI music created from the ABC notation page of 'Friday' (mid)](http://www.richelbilderbeek.nl/SongFriday.mid)
- [Go to the YouTube clip of Rebecca Black's 'Friday' (htm)](https://youtu.be/kfVsfOSbJY0)
- [Go to the Rebecca Black homepage (htm)](http://rebeccablackonline.com)
- [Download the MP3 of '"Friday"' (recorded on the 12th of August of 2011)](http://www.richelbilderbeek.nl/CD07_Friday20110812.mp3)

## [Lyrics](54_friday.txt)

See [54_friday.txt](54_friday.txt).

## Explanation of the lyrics

The song is about a programmer programming the days of the week
in C++. Many references to the C++ language and library are
in the song. Here these references are explained.

### [VERSE 1]

> .7 zip, extract in the morning
> source's gotta be fresh, gotta new download
> gotta have my tools, gotta have mercurial
> Checkin' everything, the std::time is goin'
> Tickin' on and on, internal std::clock is rushin'
> Data going down through the bus wire
> Overclocked my card, my fan is my friend (my fan)

'.7' is a zip format, a compression algorithm to make files
smaller. Such smaller files need to be unpacked before use; the raw
data needs to be extracted.

'mercurial' is a version control system, like git, except
it fit the metrum of this song better.

`std::time` is the C++ function to get the clock time/

### [PUSHPOP]

> Pushing in the front side
> Popping in the back side
> Gotta make my mind up
> Which container can I take?

In C++, some containers have a `push` member function to add an element,
and a `pop` member function to remove an element. Not all containers can
`push` in the front side (the first element) and `pop` from the back
side (removing the last element).

### [FRIDAY]

> It's "Friday", "Friday"
> My computer std::clock states it's "Friday"
> Definition lookin' up for the term "weekend", "weekend"
> "Friday", "Friday"
> Loadin' down on "Friday"
> Definition must be looked up for "weekend", "weekend"

The double quotes around `"Friday"` indicate a std::string.
`std::clock` is a function used to obtain the current time.
Apparently, it is Friday in real life, and the programmer
wonders if a Friday is part of the set of days called 'weekend'.

### [POWER4]

> Programming, programming (Yeah)
> Programming, programming (Yeah)
> std::mem_fun, std::mem_fun_ref
> Definition must be looked up for "weekend", "weekend"

The programmer is happy.
`std::mem_fun` and `std::mem_fun_ref` are
binder functions (note they are obsolete since C++11,
prefer using std::bind or lambda functions instead),
but kept in for the metrum.

### [VERSE2]

> 7:45, we're going' to Assembler
> Profilin' so fast, I want std::time to fly
> MOV, MOV, think about MOV
> You know EAX
> I got this, you got this
> It's friend has private (access) rights, ay
> I got this, you got this
> Now you trace it

It is getting late (7:45 PM) and the programmer is
starting to use the Assembly language (a low-level
programming language to directly manipulate the
registers and stack of a program). `MOV` is an Assembly
command to copy data. EAX is one of the registers.

'I got this, you got this' should be 'I got `this`, you got `this`',
as `this` is a C++ keyword for a pointer
within a member function to the object itself.

Friends of classes have access to the private parts of a class.

Tracing indicates putting (raw) data on screen, used in debugging.

### [PAST]

> "Yesterday" == "Thursday", "Thursday"
> "Today" == "Friday", "Friday" (Partyin')
> We-we are asserting
> static_asserting
> We gonna have no bugs "Today"

Here the programmer is testing his/her code.
`assert` is a C function to test in debug mode.
`static_assert` is a C++ keyword to test during compile-time.

## [FUTURE]

> "Today" + 1 == "Saturday"
> And "Sunday" comes after (prefix) ++
> I don't want a Week to have Week::end()

Here the programmer is still testing his/her code.

It appears an iterator to a weekday is implemented, that can
be incremented (using `++`).

The `week` class the programmer is working on was set up as a
container (that usually have an `end` member function), and the
programmer is regretting this design.

### [VERSE3]

> R-B, Richel Bilderbeek
> So pushing' in the front side (In the front side)
> In the back side (In the back side)
> I'm debuggin', tracin' (Yeah, yeah)
> Fast lookup, switchin' terms
> Wit' a profiler on my side (Woo!)
> (C'mon) Passin' by is a stack trace in front of me
> Make bits switch, bits shift, wanna see
> Check my std::time, it's "Friday", it's a "weekend"
> We press F5 to run, c'mon, c'mon, y'all

A profiler is a tool to measure the time (part of) a program
needs to do its work.

A stack trace is an overview of the stack of functions
being evaluated at the same time.

F5 is the key to start running in debug mode in Qt Creator.
It appears the programmer is still working on it...
