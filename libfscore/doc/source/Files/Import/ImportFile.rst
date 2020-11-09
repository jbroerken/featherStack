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
**SetFile=<Set File>**: The set file to import.

**Directory=<Directory Name>**: The name of the directory containing all set 
assets.

**File=<Relative File Path>**: The relative file path of a file belonging to 
the set. The path is relative to the given directory name and its location.