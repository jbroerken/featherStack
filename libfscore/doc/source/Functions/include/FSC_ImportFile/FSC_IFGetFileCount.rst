FSC_IFGetFileCount
==================
The FSC_IFGetFileCount function returns the amount of files to be imported from 
the card set directory.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Syntax
------
.. code-block:: c

    size_t FSC_IFGetFileCount(const FSC_ImportFileOpaque* FSC_NONNULL p_File);


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
The card set file count.

Remarks
-------
* 0 is given if the import file given was invalid.

Code Examples
-------------
None.