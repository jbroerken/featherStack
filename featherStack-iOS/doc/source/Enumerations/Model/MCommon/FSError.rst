FSCommon.FSError
================
The FSError enumeration describes possible errors for FSCommon components.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    Model/FSCommon.swift


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
    * - NoDocumentsPath
      - Could not get the documents path for the app.
    * - Encoding
      - Encountered an encoding issue for a string.
    * - InvalidPtr
      - A given C pointer was invalid.
    * - Move
      - Failed to move an item.
    * - Copy
      - Failed to copy an item.
    * - NoFile
      - The file does not exist.


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