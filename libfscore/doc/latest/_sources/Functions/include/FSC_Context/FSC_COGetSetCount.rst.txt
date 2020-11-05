FSC_COGetSetCount
=================
The FSC_COGetSetCount function returns the amount of set entries for the given 
context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    size_t FSC_COGetSetCount(FSC_ContextOpaque* FSC_NONNULL p_Context);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>` 
        to check.


Return Value
------------
The total card set entry count.

Remarks
-------
* 0 is given if the context given was invalid.

Code Examples
-------------
None.