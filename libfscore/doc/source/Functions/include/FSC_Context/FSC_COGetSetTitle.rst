FSC_COGetSetTitle
=================
The FSC_COGetSetTitle function returns the title for a set entry contained in 
a given context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    const char* FSC_NULLABLE FSC_COGetSetTitle(FSC_ContextOpaque* FSC_NONNULL p_Context, 
                                               size_t us_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>` 
        to check.
    * - us_Set
      - The set to get the title for.


Return Value
------------
The UTF-8 title **string** on success, **NULL** on failure.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.