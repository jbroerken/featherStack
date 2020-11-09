FSSetListViewModel
==================
FSSetListViewModel allows for the set list view to interact with the context 
model.

File
----
The view model definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/SetList/VMSetList.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../../Functions/ViewModel/CardSet/SetList/VMSetList/init>`
      - Internal
    * - :doc:`AddSet <../../../Functions/ViewModel/CardSet/SetList/VMSetList/AddSet>`
      - Internal
    * - :doc:`SelectEntry <../../../Functions/ViewModel/CardSet/SetList/VMSetList/SelectEntry>`
      - Internal
    * - :doc:`GrabSet <../../../Functions/ViewModel/CardSet/SetList/VMSetList/GrabSet>`
      - Internal
    * - :doc:`RemoveSet <../../../Functions/ViewModel/CardSet/SetList/VMSetList/RemoveSet>`
      - Internal
    * - :doc:`GetEntry <../../../Functions/ViewModel/CardSet/SetList/VMSetList/GetEntry>`
      - Internal


Enumerations
------------
None.

Nested
------
.. list-table::
    :header-rows: 1

    * - Name
      - Description
    * - FSSelection
      - The current selection storage struct.


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
    * - b_Changed
      - @Published Bool
      - The context changed flag.
      - Private
    * - b_ImportFailed
      - @Published Bool
      - The set import failed flag.
      - Internal
    * - c_Context
      - :doc:`../../../Models/CardSet/MContext`
      - The model to interact with.
      - Private
    * - c_Selection
      - FSSelection
      - The current selection information.
      - Private (Set)
    * - i_EntryCount
      - Int
      - The amount of set entries to choose from.
      - Internal


Remarks
-------
None.