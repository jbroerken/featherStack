FSActiveSetViewModel.Validate
=============================
The Validate function is used to setup a active set view model.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/ActiveSet/VMActiveSet.swift


Syntax
------
.. code-block:: c

    func Validate(c_Set: FSCardSet, 
                  e_Mode: FSMode) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - c_Set
      - The card set model to use.
    * - e_Mode
      - The mode to view the card set in.


Return Value
------------
None.

Remarks
-------
* :doc:`Invalidate <Invalidate>` will be called before validation.

Code Examples
-------------
None.