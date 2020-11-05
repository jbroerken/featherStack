FSC_CSGetRemainingCount
=======================
The FSC_CSGetRemainingCount function returns the amount of cards remaining to 
be completed in a given set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    size_t FSC_CSGetRemainingCount(const FSC_CardSetOpaque* FSC_NONNULL p_Set);


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
The remaining (uncompleted) card count.

Remarks
-------
None.

Code Examples
-------------
None.