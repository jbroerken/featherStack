FSC_IFGetDirName
================
The FSC_IFGetDirName function returns the name of the set directory to import.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Syntax
------
.. code-block:: c

    const char* FSC_NULLABLE FSC_IFGetDirName(const FSC_ImportFileOpaque* FSC_NONNULL p_File);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_File
      - The :doc:`import file <../../../Types/include/FSC_ImportFile/FSC_ImportFileOpaque>` 
        to check.


Return Value
------------
The UTF-8 directory name **string** on success, **NULL** on failure.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.