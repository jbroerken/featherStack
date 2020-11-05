FSC_COCreateSet
===============
The FSC_COCreateSet function is used to request (load) a card set from a given 
context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    FSC_CardSetOpaque* FSC_NULLABLE FSC_COCreateSet(FSC_ContextOpaque* FSC_NONNULL p_Context, 
                                                    size_t us_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>`
        to load the set from.
    * - us_Set
      - The set entry to load.


Return Value
------------
A new :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` on 
success, **NULL** on failure.

Remarks
-------
None.

Code Examples
-------------
None.