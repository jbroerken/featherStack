Card Set Files
==============
Card set files are used to store all known card paths. All card paths are 
expected to be relative to the directory of the card set.

Only the first matching block of the card set file will be used. Further blocks 
will be ignored.

Example File Structure
----------------------
The following example file structure shows a standard card set file.

.. literalinclude:: Example.txt

Values
------
**"Cards" = {**: The card set block definition. This is the block searched for 
by the library when loading card set files. The name of this block is static.

**"File" = "<FileName>"**: Each card file is added to the block with the "File" 
identifier followed by the file path relative to the card set directory.