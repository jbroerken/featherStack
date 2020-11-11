FSCardSet
=========
The FSCardSet model is used to interact with the currently active card set.

File
----
The model definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MCardSet.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../Functions/Model/CardSet/MCardSet/init>`
      - Internal
    * - :doc:`deinit <../../Functions/Model/CardSet/MCardSet/deinit>`
      - Internal
    * - :doc:`LoadCard <../../Functions/Model/CardSet/MCardSet/LoadCard>`
      - Internal
    * - :doc:`DestroyCard <../../Functions/Model/CardSet/MCardSet/DestroyCard>`
      - Internal


Enumerations
------------
.. list-table::
    :header-rows: 1

    * - Enumeration
      - Visibility
    * - :doc:`FSError <../../Enumerations/Model/CardSet/MCardSet/FSError>`
      - Internal


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
    * - c_Context
      - :doc:`MContext`
      - The context this set was created from.
      - Private
    * - p_Set
      - :doc:`../../Types/Model/CardSet/MContext/CCardSet`?
      - The library card set pointer in use.
      - Private
    * - s_Title
      - String
      - The card set title.
      - Internal
    * - i_TotalCount
      - Int
      - The total card count for this set.
      - Internal
    * - i_RemainingCount
      - Int
      - The remaining (not completed) card count for this set.
      - Internal
    * - s_DirPath
      - String
      - The path to the card set directory.
      - Internal
    * - p_Callback
      - FSC_Callback
      - The card load callback for the library.
      - Fileprivate


Remarks
-------
* The directory path is absolute from the root to the set directory.