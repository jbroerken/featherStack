FSC_CSUsable
============
The FSC_CSUsable function is used check the validity of a given card set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_CardSetData.h


Syntax
------
.. code-block:: c

    bool FSC_CSUsable(const FSC_CardSet* p_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The card set to check.


Return Value
------------
**true** if the card set is usable, **false** if not.

Remarks
-------
* This function will set an apropriate C style error if it fails.

Code Examples
-------------
None.