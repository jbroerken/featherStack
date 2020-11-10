FSContext.FSError
=================
The FSError enumeration describes possible errors for FSContext components.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MContext.swift


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
    * - NoContext
      - No valid library context pointer exists.
    * - NoSet
      - The requested set entry does not exist.
    * - CreateFailed
      - Failed to load a set entry from context.
    * - ImportFailed
      - Failed to import a new set for the context.


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