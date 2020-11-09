FSSetListView
=============
FSSetListView displays the card set entries available to use as well as the 
search bar. This view is shown when selecting the card set tab.

File
----
The view definition can be found in the following file:

.. code-block:: c

    View/CardSet/SetList/VSetList.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../../Functions/View/CardSet/SetList/VSetList/init>`
      - Internal
    * - :doc:`../../../Functions/View/CardSet/SetList/VSetList/SelectEntry`
      - Private
    * - :doc:`../../../Functions/View/CardSet/SetList/VSetList/ResetSelection`
      - Private


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
      - @EnvironmentObject :doc:`../../../ViewModel/Settings/VMSettings`
      - The application settings.
      - Internal
    * - c_Model
      - @StateObject :doc:`../../../ViewModel/CardSet/SetList/VMSetList`
      - The view model for the view.
      - Private
    * - s_AddURL
      - @Binding URL
      - The file import url.
      - Internal
    * - s_SearchText
      - @State String
      - The search text for set filtering.
      - Private
    * - i_Navigate
      - @State Int?
      - The navigation request to perform.
      - Private


Remarks
-------
None.