FSC_COCreate
============
The FSC_COCreate function is used to create a new context.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Syntax
------
.. code-block:: c

    FSC_ContextOpaque* FSC_NULLABLE FSC_COCreate(const char* FSC_NONNULL p_DirPath, 
                                                 const char* FSC_NONNULL p_FileName, 
                                                 size_t us_CacheLimit);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_DirPath
      - The UTF-8 directory path to use.
    * - p_FileName
      - The UTF-8 contet file name in the given directory.
    * - us_CacheLimit
      - The card storage cache limit for all context created sets.


Return Value
------------
A new :doc:`context <../../../Types/include/FSC_Context/FSC_ContextOpaque>` on 
success, **NULL** on failure.

Remarks
-------
None.

Code Examples
-------------
None.