FSC_ImportFile (struct FSC_ImportFile_t)
========================================
The FSC_ImportFile struct stores all important content of an import file.

Header
------
The struct definition can be found in the following file:

.. code-block:: c

    src/FSC_ImportFileData.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_ImportFile_t <../../../Functions/src/FSC_ImportFileData/FSC_ImportFile/FSC_ImportFile_t>`
      - Public
    * - :doc:`~FSC_ImportFile_t <../../../Functions/src/FSC_ImportFileData/FSC_ImportFile/~FSC_ImportFile_t>`
      - Public


Enumerations
------------
None.

Nested
------
None.

Inherited
---------
None.

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - s_SetFile
      - std::string
      - The UTF-8 formatted set file to import.
      - Public
    * - s_DirName
      - std::string
      - The UTF-8 formatted directory name to import.
      - Public
    * - v_FilePath
      - std::vector<std::string>
      - All UTF-8 formatted file paths for the set.
      - Public


Remarks
-------
* Operator **new** and operator **delete** should be used for this struct due 
  to the use of a constructor and destructor as well as the use of C++ 
  containers.
* This struct will be given to the library user in the form of 
  :doc:`../../../Types/include/FSC_ImportFile/FSC_ImportFileOpaque`.
* The set file and directory will be checked relative to the import directory.
* The file paths are relative to the given directory name inside the import 
  directory.