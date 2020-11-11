FSSetListViewModel.GetEntry
===========================
The GetEntry function is used to get a card set entry from the set list. This 
function also allows for filtering.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/SetList/VMSetList.swift


Syntax
------
.. code-block:: c

    func GetEntry(i_Entry: Int, 
                  s_Filter: String, 
                  b_Exact: Bool) -> FSContext.FSEntry?


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - i_Entry
      - The index of the entry in the set entry list.
    * - s_Filter
      - The set title filter to apply.
    * - b_Exact
      - Wether the strings have to match exactly or not.


Return Value
------------
The **entry** if the given index was valid and the applied filters were passed, 
**nil** if not.

Remarks
-------
None.

Code Examples
-------------
None.