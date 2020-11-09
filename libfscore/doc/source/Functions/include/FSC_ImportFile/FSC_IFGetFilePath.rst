FSC_IFGetFilePath
=================
The FSC_IFGetFilePath function returns the path of a file to import.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Syntax
------
.. code-block:: c

    const char* FSC_NULLABLE FSC_IFGetFilePath(const FSC_ImportFileOpaque* FSC_NONNULL p_File, 
                                               size_t us_File);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_File
      - The :doc:`import file <../../../Types/include/FSC_ImportFile/FSC_ImportFileOpaque>` 
        to check.
    * - us_File
      - The set file to get the path for.


Return Value
------------
The UTF-8 file path **string** on success, **NULL** on failure.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.