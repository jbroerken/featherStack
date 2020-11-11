FSSetListViewModel.GrabSet
==========================
The GrabSet function is used to return the model of the currently selected set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/SetList/VMSetList.swift


Syntax
------
.. code-block:: c

    func GrabSet() -> FSCardSet?


Parameters
----------
None

Return Value
------------
The **set model** for the selected set on success, **nil** on failure.

Remarks
-------
* The set is chosen by the :doc:`SelectEntry <SelectEntry>` function.

Code Examples
-------------
None.