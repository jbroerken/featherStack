FSCardView
==========
FSCardView displays the card currently reviewed by the user.

File
----
The view definition can be found in the following file:

.. code-block:: c

    View/CardSet/ActiveSet/VCard.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../../Functions/View/CardSet/ActiveSet/VCard/init>`
      - Internal
    * - :doc:`CardAppear <../../../Functions/View/CardSet/ActiveSet/VCard/CardAppear>`
      - Private
    * - :doc:`FlipCard <../../../Functions/View/CardSet/ActiveSet/VCard/FlipCard>`
      - Private
    * - :doc:`CardDisappear <../../../Functions/View/CardSet/ActiveSet/VCard/CardDisappear>`
      - Private
    * - :doc:`ShowTutorial <../../../Functions/View/CardSet/ActiveSet/VCard/ShowTutorial>`
      - Private
    * - :doc:`GetFlipped <../../../Functions/View/CardSet/ActiveSet/VCard/GetFlipped>`
      - Private


Enumerations
------------
.. list-table::
    :header-rows: 1

    * - Name
      - Visibility
    * - :doc:`FSState <../../../Enumerations/View/CardSet/ActiveSet/VCard/FSState>`
      - Private
      

Nested
------
None.

Inherited
---------
.. list-table::
    :header-rows: 1

    * - Source
      - Description
    * - View
      - SwiftUI view parent.
      

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - c_Settings
      - @EnvironmentObject :doc:`../../../ViewModels/Settings/VMSettings`
      - The application settings.
      - Internal
    * - c_Model
      - @StateObject :doc:`../../../ViewModels/CardSet/ActiveSet/VMCard`
      - The view model for the view.
      - Private
    * - e_State
      - @State :doc:`FSState <../../../Enumerations/View/CardSet/ActiveSet/VCard/FSState>`
      - The current card display state.
      - Internal
    * - c_Offset
      - @State CGSize
      - The card offset.
      - Private
    * - b_ShowTutorial
      - @State Bool
      - Wether to show the tutorial alert or not.
      - Private
    * - FSC_Image
      - Int32
      - The image C enum value.
      - Private


Remarks
-------
* The various display states are irrelevant for the view model, this 
  functionality has therefore been moved into the view.