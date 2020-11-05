Context Files
==============
Context files store all set entries available in the current context directory.

Each valid block will be read as a new entry. Adding invalid values to a block 
identifier will cause the set entry for the identifier to fail.

Example File Structure
----------------------
The following example file structure shows a standard context file.

.. literalinclude:: Example.txt

Values
------
**"CardSet" = {**: The card set definition. This is the block searched for by 
the library when loading card files. The name of this block is static.

**"Title" = "<String>"**: The card title to display for this entry.

**"Subtitle" = "<String>"**: The card subtitle to display for this entry.

**"Directory" = "<String>"**: The name of the card set directory relative to 
the context directory.

**"Set_File" = "<String>"**: The card set file path relative to the combined 
context and card set directory.

**"Icon_File" = "<String>"**: The set icon file path relative to the combined 
context and card set directory.