TM-Terminal
============

defines a TextMate command called `Export TM_* Variables to Terminal`. This
command replicates the environment of the running TextMate instance and
injects it into a shell inside Terminal.app, together with some supporting
functionality. This setup creates a first approximation to a “TextMate REPL”,
which may be useful for debugging your own bundles or semi-related stuff, e.g.
for testing how commands would run with Rubinius as `TM_RUBY`.

All of this could be done from within TextMate itself, but I thought some
people might prefer using their shell directly. I certainly do. ;-)


Installation
------------

This project’s current incarnation contains a single `.tmCommand` file which can be installed simply by double-clicking it.

To install it from your shell:

* `cd` to some directory, say `~/Downloads`
* `git clone git://github.com/mkhl/tm-terminal.git`
* `open "tm-terminal/Export TM_* Variables to Terminal.tmCommand"`