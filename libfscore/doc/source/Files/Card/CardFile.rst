Card Files
==========
Card files store the information for each card shown in a set.

Only the first matching block of the card file will be used. Further blocks 
will be ignored. Also, only the first matching identifier and value pair for 
a card information will be used. Further duplicate identifiers will be ignored.

Invalid value information causes a card load to fail.

Example File Structure
----------------------
The following example file structure shows a standard card file.

.. literalinclude:: Example.txt

Values
------
**"Card" = {**: The card block definition. This is the block searched for by 
the library when loading card files. The name of this block is static.

**"Type" = "<Integer>"**: The card data type is defined with the integer added 
here.

**"Data" = "<String>"**: The card data string is interpreted depending on the 
chosen card type. This string might pointer to a file relative to the card set 
file or be used as a text question.

**"Question" = "<Integer>"**: The card question to display.

**"Answer" = "<Integer>"**: The card answer to display.