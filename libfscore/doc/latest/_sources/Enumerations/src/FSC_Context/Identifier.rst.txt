Identifier (FSC_Context)
========================
The FSC_Context identifier enumeration is used to describe the available 
value identifiers and their index position as well as the last identifier and 
the amount of identifiers.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    src/FSC_Context.cpp


Definition
----------
The defined enumeration values are as follows:

.. code-block:: c

    enum Identifier
    {
        TITLE = 0,
        SUBTITLE = 1,
        DIRECTORY = 2,
        SET_FILE = 3,
        ICON_FILE = 4,
        
        IDENTIFIER_MAX = ICON_FILE,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1   
    };


Values
------
The meaning behind the enumeration values is as follows:

.. list-table::
    :header-rows: 1

    * - Enumeration
      - Description
    * - TITLE
      - The title value identifier index.
    * - SUBTITLE
      - The subtitle value identifier index.
    * - DIRECTORY
      - The directory name value identifier index.
    * - SET_FILE
      - The set file name value identifier index.
    * - ICON_FILE
      - The icon file name value identifier index.
    * - IDENTIFIER_MAX
      - The highest identifier in this enumeration.
    * - IDENTIFIER_COUNT
      - The amount of identifiers in this enumeration.