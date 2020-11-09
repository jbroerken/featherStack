FSC_IFDestroy
=============
The FSC_IFDestroy function is used to destroy a given import file.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Syntax
------
.. code-block:: c

    FSC_ImportFileOpaque* FSC_NULLABLE FSC_IFDestroy(FSC_ImportFileOpaque* FSC_NONNULL p_File);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_File
      - The :doc:`import file <../../../Types/include/FSC_ImportFile/FSC_ImportFileOpaque>` 
        to destroy.


Return Value
------------
**NULL** on success, the **given import file** on failure.

Remarks
-------
None.

Code Examples
-------------
None.