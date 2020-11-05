FSC_CORemoveSet
===============
The FSC_CORemoveSet function is used to remove a card set entry from a given 
context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    int FSC_CORemoveSet(FSC_ContextOpaque* FSC_NONNULL p_Context, 
                        size_t us_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>`
        to remove the set from.
    * - us_Set
      - The set entry to remove.


Return Value
------------
**0** on success, **-1** on failure.

Remarks
-------
* The card set files have to be deleted by the library user. This function only 
  overwrites the context set list.

Code Examples
-------------
None.