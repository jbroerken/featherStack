Import Files
============
Import files are used by libfscore to know which files an directories to import 
as a card set. The file only contains two lines with text and no other content. 

Example File Structure
----------------------
The following example file structure shows a standard import file.

.. literalinclude:: Example.txt

Values
------
**First Line**: The first line contains only the name of the card set file 
(with the file extension).

**Second Line**: The second line contains only the directory name of the card 
set files (cards, assets).