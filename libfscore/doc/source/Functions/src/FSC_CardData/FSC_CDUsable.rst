FSC_CDUsable
============
The FSC_CDUsable function is used check the validity of a given card.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_CardData.h


Syntax
------
.. code-block:: c

    bool FSC_CDUsable(const FSC_Card* p_Card);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The card to check.


Return Value
------------
**true** if the card is usable, **false** if not.

Remarks
-------
* This function will set an apropriate C style error if it fails.

Code Examples
-------------
None.