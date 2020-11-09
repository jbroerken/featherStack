FSC_IFCreate
============
The FSC_IFCreate function is used to create a new import file.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Syntax
------
.. code-block:: c

    FSC_ImportFileOpaque* FSC_NULLABLE FSC_IFCreate(const char* FSC_NONNULL p_FilePath);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_FilePath
      - The UTF-8 file path to use.


Return Value
------------
A new :doc:`context <../../../Types/include/FSC_ImportFile/FSC_ImportFileOpaque>` 
on success, **NULL** on failure.

Remarks
-------
None.

Code Examples
-------------
None.