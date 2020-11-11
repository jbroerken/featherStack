FSCardSet.CreateSet
===================
The CreateSet function is used to load a card set defined by a set entry.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MContext.swift


Syntax
------
.. code-block:: c

    CreateSet(_ i_Entry: Int) throws -> CCardSet


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - i_Entry
      - The set entry for the card set to load.


Return Value
------------
The requested :doc:`card set <../../../../Types/Model/CardSet/MContext/CCardSet>`. 

Remarks
-------
None.

Code Examples
-------------
None.