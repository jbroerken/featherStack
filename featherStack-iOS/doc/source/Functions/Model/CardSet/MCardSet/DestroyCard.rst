FSCardSet.DestroyCard
=====================
The DestroyCard function is used to return a card to the set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MCardSet.swift


Syntax
------
.. code-block:: c

    func DestroyCard(p_Card: CCard, 
                     b_Completed: Bool) throws -> CCard?


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The :doc:`card <../../../../Types/Model/CardSet/MCardSet/CCard>` to 
        destroy.
    * - b_Completed
      - The card completion (answered correctly) state.


Return Value
------------
**nil** if the card was destroyed, the **given pointer** on failure.

Remarks
-------
None.

Code Examples
-------------
None.