FSCardSet.DestroySet
====================
The DestroySet function is used to return a card set to the context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MContext.swift


Syntax
------
.. code-block:: c

    func DestroySet(_ p_Set: CCardSet) throws -> CCardSet?


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../../Types/Model/CardSet/MContext/CCardSet>` 
        to destroy.


Return Value
------------
**nil** if the card set was destroyed, the **given pointer** on failure.

Remarks
-------
None.

Code Examples
-------------
None.