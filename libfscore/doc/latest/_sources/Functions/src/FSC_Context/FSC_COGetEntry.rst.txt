FSC_COGetEntry
==============
The FSC_COGetEntry function is used get a set entry from a context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_Context.cpp


Syntax
------
.. code-block:: c

    static inline FSC_Entry const& FSC_COGetEntry(const FSC_Context* p_Context, 
                                                  size_t us_Set)


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The context containing the set entry.
    * - us_Set
      - The set entry index.


Return Value
------------
A reference to the requested set entry.

Remarks
-------
None.

Code Examples
-------------
None.