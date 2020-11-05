FSC_CSGetTotalCount
===================
The FSC_CSGetTotalCount function returns the total amount of cards in a given 
set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    size_t FSC_CSGetTotalCount(const FSC_CardSetOpaque* FSC_NONNULL p_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` 
        to check.


Return Value
------------
The total card count.

Remarks
-------
None.

Code Examples
-------------
None.