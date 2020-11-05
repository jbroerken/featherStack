FSC_CDType
==========
The FSC_CDType enumeration lists the card types known to the library. This 
enumeration describes what kind of data should be displayed with the cards 
"p_Data" string.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    include/FSC_Card.h


Definition
----------
The defined enumeration values are as follows:

.. code-block:: c

    typedef enum
    {
        FSC_CTYPE_UNK = -1,
        
        FSC_CDTYPE_TEXT = 0,
        FSC_CDTYPE_IMAGE = 1,
        FSC_CDTYPE_SOUND = 2,
        
        FSC_CDTYPE_MAX = FSC_CDTYPE_SOUND,
        
        FSC_CDTYPE_COUNT = 4

    }FSC_CDType;


Values
------
The meaning behind the enumeration values is as follows:

.. list-table::
    :header-rows: 1

    * - Enumeration
      - Description
    * - FSC_CTYPE_UNK
      - The card data is not known.
    * - FSC_CDTYPE_TEXT
      - The data data should be interpreted as a text string.
    * - FSC_CDTYPE_IMAGE
      - The data data should be interpreted as a image file path.
    * - FSC_CDTYPE_SOUND
      - The data data should be interpreted as a sound file path.
    * - FSC_CDTYPE_MAX
      - The highest identifier in this enumeration.
    * - FSC_CDTYPE_COUNT
      - The amount of identifiers in this enumeration.