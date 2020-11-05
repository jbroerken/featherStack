FSC_ValueFile::GetValue
=======================
The GetValue function is used to search for a value based on a identifer for a 
given block.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    std::string const& GetValue(std::string const& s_Block, 
                                std::string const& s_Identifier);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Block
      - The UTF-8 block name string.
    * - s_Identifier
      - The UTF-8 value identifier string.


Return Value
------------
A UTF-8 formatted value string for the given block identifier.

Remarks
-------
* The first matching block with a matching identifier will be chosen in case of 
  multiple block with the same name.

Code Examples
-------------
None.