FSC_ValueFile::IsBlockEnd
=========================
The IsBlockEnd function checks for the end of a value block.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    inline bool IsBlockEnd(std::string const& s_Line) noexcept;


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
**true** if the line is a block end, **false** if not.

Remarks
-------
None.

Code Examples
-------------
None.