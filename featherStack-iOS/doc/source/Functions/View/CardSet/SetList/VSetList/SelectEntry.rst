FSSetListView.SelectEntry
=========================
The SelectEntry function is used to save selection info like the set entry and 
chosen mode.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    View/CardSet/SetList/VSetList.swift


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
      - The set entry selected.
    * - s_Title
      - The title of the selected entry.
    * - e_Mode
      - The card set viewing :doc:`mode <../../../../../Enumerations/ViewModel/CardSet/ActiveSet/VMActiveSet/FSMode>`.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.