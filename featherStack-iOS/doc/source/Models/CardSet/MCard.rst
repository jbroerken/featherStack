FSCard
======
The FSCard model contains the data for the currently active card.

File
----
The model definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MCard.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../Functions/Model/CardSet/MCard/init>`
      - Internal
    * - :doc:`deinit <../../Functions/Model/CardSet/MCard/deinit>`
      - Internal


Enumerations
------------
None.

Nested
------
None.

Inherited
---------
None.

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - c_Set
      - :doc:`MCardSet`
      - The card set this card belongs to.
      - Private
    * - p_Card
      - :doc:`../../Types/Model/CardSet/MCardSet/CCard`?
      - The library card pointer in use.
      - Private
    * - b_Completed
      - Bool
      - The card completion (answered) state.
      - Internal
    * - b_Loaded
      - Bool
      - The card load state.
      - Internal
    * - s32_Type
      - Int32
      - The card type.
      - Internal
    * - s_Data
      - String
      - The card data identification string.
      - Internal
    * - s_Question
      - String
      - The card question string.
      - Internal
    * - s_Answer
      - String
      - The card answer string.
      - Internal


Remarks
-------
None.