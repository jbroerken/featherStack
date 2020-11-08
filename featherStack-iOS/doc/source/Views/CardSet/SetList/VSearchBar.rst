FSSearchBarView
===============
FSSearchBarView displays the search field for the user to type into for card 
set filtering.

File
----
The view definition can be found in the following file:

.. code-block:: c

    View/CardSet/SetList/VSearchBar.swift


Functions
---------
None.

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
    * - s_Text
      - @Binding String
      - The external search string to write to.
      - Internal
    * - b_Editing
      - @State Bool
      - The currently editing (active) flag.
      - Private


Remarks
-------
None.