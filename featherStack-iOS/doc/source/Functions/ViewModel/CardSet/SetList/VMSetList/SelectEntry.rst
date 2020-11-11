FSSetListViewModel.SelectEntry
==============================
The SelectEntry function is used to update the current user selection.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/SetList/VMSetList.swift


Syntax
------
.. code-block:: c

    func SelectEntry(i_Entry: Int, 
                     s_Title: String, 
                     e_Mode: FSActiveSetViewModel.FSMode) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - i_Entry
      - The index of the entry in the set entry list.
    * - s_Title
      - The title of the card set entry.
    * - e_Mode
      - The :doc:`mode <../../../../../Enumerations/ViewModel/CardSet/ActiveSet/VMActiveSet/FSMode>` 
        for the set to be viewed in.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.