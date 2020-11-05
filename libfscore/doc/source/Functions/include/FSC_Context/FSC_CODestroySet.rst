FSC_CODestroySet
================
The FSC_CODestroySet function is used to return a card set to a given context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    FSC_CardSetOpaque* FSC_NULLABLE FSC_CODestroySet(FSC_ContextOpaque* FSC_NONNULL p_Context, 
                                                     FSC_CardSetOpaque* FSC_NONNULL p_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>`
        to return the set tp.
    * - p_Set
      - The set to return.


Return Value
------------
**NULL** on success, the given **card set** on failure.

Remarks
-------
* The card set is not deallocated and will be reused.

Code Examples
-------------
None.