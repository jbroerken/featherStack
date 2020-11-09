FSActiveSetViewModel
====================
FSActiveSetViewModel provides information about the current card set to the 
view.

File
----
The view model definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/ActiveSet/VMActiveSet.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`deinit <../../../Functions/ViewModel/CardSet/ActiveSet/VMActiveSet/init>`
      - Internal
    * - :doc:`Validate <../../../Functions/ViewModel/CardSet/ActiveSet/VMActiveSet/Validate>`
      - Internal
    * - :doc:`Validate <../../../Functions/ViewModel/CardSet/ActiveSet/VMActiveSet/Invalidate>`
      - Internal
    * - :doc:`../../../Functions/ViewModel/CardSet/ActiveSet/VMActiveSet/NextCard`
      - Internal


Enumerations
------------
.. list-table::
    :header-rows: 1

    * - Name
      - Visibility
    * - :doc:`../../../Enumerations/ViewModel/CardSet/ActiveSet/VMActiveSet/Mode`
      - Internal


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
    * - c_Card
      - @Published :doc:`../../../Models/CardSet/MCard`?
      - The card to display.
      - Private (Set)
    * - c_Set
      - :doc:`../../../Models/CardSet/MCardSet`
      - The model to interact with.
      - Private
    * - e_Mode
      - :doc:`../../../Enumerations/ViewModel/CardSet/ActiveSet/VMActiveSet/Mode`
      - The type of set interaction chosen.
      - Private (Set)
    * - s_Title
      - String
      - The card set title.
      - Internal
    * - i_TotalCount
      - Int
      - The total set card count.
      - Internal
    * - i_RemainingCount
      - Int
      - The amount of cards waiting to be completed.
      - Internal
    * - s_DirPath
      - String
      - The path to the card set directory.
      - Internal


Remarks
-------
None.