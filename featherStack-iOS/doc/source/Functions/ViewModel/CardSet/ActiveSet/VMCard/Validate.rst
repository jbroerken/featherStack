FSCardViewModel.Validate
========================
The Validate function is used to setup a card view model.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/CardSet/ActiveSet/VMCard.swift


Syntax
------
.. code-block:: c

    func Validate(c_Card: FSCard?, 
                  s_DirPath: String, 
                  f_Answered: ((Bool) -> ())) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - c_Card
      - The card model to use.
    * - s_DirPath
      - The path to the card set directory for this card.
    * - f_Answered
      - The answer callback to perform.


Return Value
------------
None.

Remarks
-------
* :doc:`Invalidate <Invalidate>` will be called before validation.
* The callback function is escaping and should be kept alive as long as its 
  needed.

Code Examples
-------------
None.