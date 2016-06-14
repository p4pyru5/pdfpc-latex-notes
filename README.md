pdfpc-latex-notes
=================

This is a Latex Package that allows creating [pdfpc](http://davvil.github.io/pdfpc/)
compatible notes file directly from your latex presentation `\note`s.


This is forked from [cebe/pdfpc-latex-notes](https://github.com/cebe/pdfpc-latex-notes).

Usage
-----

Download [pdfpcnotes.sty](https://raw.github.com/cebe/pdfpc-latex-notes/master/pdfpcnotes.sty)
from github and put it somewhere where latex can find it.  
The same directory as your `.tex` file will work.

Add `\usepackage{pdfpcnotes}` somewhere before `\begin{document}` in your `.tex`-file.
You can also put it in subdirectory and use \usepackage{subdir/pdfpcnotes}

You can then use the `\pnote{}` command like you used `\note{}` before.
Behavior will be the same but it will additionally write notes to note-output-file in pdfpc readable format.
To migrate the notes into the pdfpc-file, you should run the shell-script.
This will automatically convert the tex newline `\\` to `\n`.

What is different to cebes Version
---------------
- collected notes are written to file with `.pdfpc.notes` extension.
- you have to migrate the notes manually or with the shell script
- all settings in pdfpc will be preserved, only notes section will be overwritten


