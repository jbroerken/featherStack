FSC_ValueFile::Block::GetValue
==============================
The GetValue function is used to search for a value based on a identifer.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    std::string const& GetValue(std::string const& s_Identifier);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Identifier
      - The UTF-8 value identifier string.


Return Value
------------
A UTF-8 formatted value string for the given identifier.

Remarks
-------
None.

Code Examples
-------------
None.