FSC_IFGetValue
==============
The FSC_IFGetValue function is used to read the value for an identifier from a 
given line.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_ImportFile.cpp


Syntax
------
.. code-block:: c

    inline std::string FSC_IFGetValue(std::string const& s_Line, 
                                      Identifier e_Identifier)


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Line
      - The file line to check.
    * - e_Identifier
      - The :doc:`identifier <../../../Enumerations/src/FSC_ImportFile/Identifier>` 
        to search for.


Return Value
------------
The value for the identifier.

Remarks
-------
None.

Code Examples
-------------
None.