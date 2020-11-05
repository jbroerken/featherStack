FSC_CSGetFinished
=================
The FSC_CSGetFinished function is used to check if all cards in a set have been 
completed.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    int FSC_CSGetFinished(const FSC_CardSetOpaque* FSC_NONNULL p_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` to 
        check.


Return Value
------------
**0** if the set was finished, **-1** if not.

Remarks
-------
None.

Code Examples
-------------
None.