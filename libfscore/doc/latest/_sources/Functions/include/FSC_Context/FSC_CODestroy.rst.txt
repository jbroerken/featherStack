FSC_CODestroy
=============
The FSC_CODestroy function is used to destroy a given context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    FSC_ContextOpaque* FSC_NULLABLE FSC_CODestroy(FSC_ContextOpaque* FSC_NONNULL p_Context);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Context
      - The :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>` 
        to destroy.


Return Value
------------
**NULL** on success, the **given context** on failure.

Remarks
-------
None.

Code Examples
-------------
None.