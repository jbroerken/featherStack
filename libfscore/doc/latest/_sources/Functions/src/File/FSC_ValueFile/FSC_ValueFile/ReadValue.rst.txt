FSC_ValueFile::ReadValue
========================
The ReadValue function grabs the identifier and value from a line and inserts 
it in the current block.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    inline void ReadValue(std::string const& s_Line) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Line
      - The UTF-8 file line to check.


Return Value
------------
None.

Remarks
-------
* The identifier and value pair is only added if the value string length is 
  greater than zero.

Code Examples
-------------
None.