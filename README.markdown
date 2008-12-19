What this is
============

`TM-Terminal` is a set of files that define TextMate command called `Export
TM_* Variables to Terminal`. That command replicates the environment of the
running TextMate instance and loads it into a shell in Terminal.app, together
with some supporting functionality. This setup creates a first approximation
to a “TextMate REPL”, which may be useful for debugging your own bundles or
semi-related stuff like testing how certain commands would run with Rubinius
instead of MatzRuby.

All of this could be done from within TextMate itself, but I thought some
people might prefer using their shell directly. I certainly do. ;-)


Installation
------------

This project’s current incarnation is a delta against the “Bundle Development” bundle, which is where I would expect its functionality.

To install it like this:

* `cd` to `$HOME/Library/Application Support/TextMate/Bundles`
* Make sure that no `Bundle Development.tmbundle` is present
* Run `git clone git://github.com/mkhl/tm-terminal.git "Bundle Development.tmbundle"`