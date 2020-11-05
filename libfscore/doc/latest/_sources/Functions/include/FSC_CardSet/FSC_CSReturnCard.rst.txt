FSC_CSReturnCard
================
The FSC_CSReturnCard function returns a card to the card set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    FSC_CardOpaque* FSC_NULLABLE FSC_CSReturnCard(FSC_CardSetOpaque* FSC_NONNULL p_Set, 
                                                  FSC_CardOpaque* FSC_NONNULL p_Card, 
                                                  int i_Completed);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` 
        to return to.
    * - p_Card
      - The :doc:`card <../../../Types/include/FSC_Card/FSC_CardOpaque>` to 
        return.
    * - i_Completed
      - 0 if the card was completed, -1 if not.


Return Value
------------
**NULL** on success, the **given card** on failure.

Remarks
-------
* The card is not deallocated and will be reused.
* Cards not completed appear again while grabbing a card.

Code Examples
-------------
None.