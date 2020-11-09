Identifier (FSC_ImportFile)
===========================
The FSC_ImportFile identifier enumeration is used to describe the available 
identifiers and their index position as well as the last identifier and the 
amount of identifiers.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    src/FSC_ImportFile.cpp


Definition
----------
The defined enumeration values are as follows:

.. code-block:: c

    enum Identifier
    {
        SET_FILE = 0,
        DIR_NAME = 1,
        FILE_PATH = 2,
        
        IDENTIFIER_MAX = FILE_PATH,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1   
    };


Values
------
The meaning behind the enumeration values is as follows:

.. list-table::
    :header-rows: 1

    * - Enumeration
      - Description
    * - SET_FILE
      - The set file identifier index.
    * - DIRECTORY
      - The directory name identifier index.
    * - FILE_PATH
      - The set file path value identifier index.
    * - IDENTIFIER_MAX
      - The highest identifier in this enumeration.
    * - IDENTIFIER_COUNT
      - The amount of identifiers in this enumeration.