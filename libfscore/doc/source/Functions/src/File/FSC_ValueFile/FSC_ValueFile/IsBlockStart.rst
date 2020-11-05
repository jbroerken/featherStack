FSC_ValueFile::IsBlockStart
===========================
The IsBlockStart function checks for a value block and creates said block if 
found.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    inline bool IsBlockStart(std::string const& s_Line) noexcept;


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
**true** if the line is a block start, **false** if not.

Remarks
-------
None.

Code Examples
-------------
None.