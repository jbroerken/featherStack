FSCardViewModel
===============
FSCardViewModel provides information about the current card to the view.

File
----
The view model definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/ActiveSet/VMCard.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`deinit <../../../Functions/ViewModel/CardSet/ActiveSet/VMCard/init>`
      - Internal
    * - :doc:`Validate <../../../Functions/ViewModel/CardSet/ActiveSet/VMCard/Validate>`
      - Internal
    * - :doc:`Invalidate <../../../Functions/ViewModel/CardSet/ActiveSet/VMCard/Invalidate>`
      - Internal


Enumerations
------------
None.

Nested
------
None.

Inherited
---------
.. list-table::
    :header-rows: 1

    * - Source
      - Description
    * - ObservableObject
      - View observable parent.
      

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - b_Loaded
      - @Published Bool
      - The card loaded flag.
      - Private (Set)
    * - b_LoadFailed
      - @Published Bool
      - The card load failed flag.
      - Internal
    * - c_Card
      - :doc:`../../../Models/CardSet/MCard`
      - The model to interact with.
      - Private
    * - s_DirPath
      - String
      - The path to the card set directory.
      - Private
    * - f_Answered
      - ((Bool) -> ())?
      - The callback to perform when a card answer was given.
      - Private (Set)
    * - s32_Type
      - Int32
      - The card type.
      - Internal
    * - s_Data
      - String
      - The card data information.
      - Internal
    * - s_Question
      - String
      - The card question.
      - Internal
    * - s_Answer
      - String
      - The card answer.
      - Internal


Remarks
-------
None.