FSImport.FSError
================
The FSError enumeration describes possible errors for FSImport components.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Inherited
---------
.. list-table::
    :header-rows: 1

    * - Source
      - Description
    * - Error
      - Error parent.


Identifiers
-----------
.. list-table::
    :header-rows: 1

    * - Name
      - Description
    * - AlreadyImported
      - The set was already imported.
    * - NoImportFile
      - Failed to read the set import file.
    * - NoSetFile
      - The new set has no set info file.
    * - NoSetDirectory
      - The new set has no data directory.
    * - CopyFailed
      - Failed to copy an item.


Functions
---------
None.

Values
------
.. list-table::
    :header-rows: 1

    * - Name
      - Description
    * - s_String
      - The error description string.