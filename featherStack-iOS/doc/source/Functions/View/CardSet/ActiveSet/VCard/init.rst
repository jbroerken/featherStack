FSCardView.init
===============
The init function is used to initialize the view.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    View/CardSet/ActiveSet/VCard.swift


Syntax
------
.. code-block:: c

    init(c_Card: FSCard?, 
         s_DirPath: String, 
         f_Answered: ((Bool) -> ()))


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - c_Card
      - The card to display.
    * - s_DirPath
      - The path to the card set directory for the card.
    * - f_Answered
      - The answer callback to perform on user answer gesture.


Return Value
------------
None.

Remarks
-------
* The callback is escaping and its source should be active as long as it is 
  required.

Code Examples
-------------
None.