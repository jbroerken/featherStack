FSC_Error
==========
The FSC_Error enumeration describes all errors which can occur and be caught by 
the user of the library.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    include/Error/FSC_Error.h


Definition
----------
The defined enumeration values are as follows:

.. code-block:: c

    typedef enum
    {
        // None
        FSC_ERROR_NONE = -1,
        
        // Unknown
        FSC_ERROR_UNK = 0,
        
        // General
        FSC_ERROR_GENERAL_INVALID_PARAM = 1,
        FSC_ERROR_GENERAL_MALLOC = 2,
        
        // Card Set
        FSC_ERROR_CARD_SET_NOT_CARDS = 3,
        
        // Context
        FSC_ERROR_CONTEXT_NO_SET = 4,
        
        // Bounds
        FSC_ERROR_TYPE_MAX = FSC_ERROR_CONTEXT_NO_SET,

        FSC_ERROR_TYPE_COUNT = FSC_ERROR_TYPE_MAX + 1

    }FSC_Error;


Values
------
The meaning behind the enumeration values is as follows:

.. list-table::
    :header-rows: 1

    * - Enumeration
      - Description

    * - FSC_ERROR_NONE
      - No error occured or the error was reset.
    * - FSC_ERROR_UNK
      - An unknown error occured.
    * - FSC_ERROR_GENERAL_INVALID_PARAM
      - One or more parameters given to a function were invalid.
    * - FSC_ERROR_GENERAL_MALLOC
      - Dynamic memory allocation failed.
    * - FSC_ERROR_CARD_SET_NOT_CARDS
      - The used card set has no cards.
    * - FSC_ERROR_CONTEXT_NO_SET
      - The used context has no card set available.
    * - FSC_ERROR_TYPE_MAX
      - The highest identifier in this enumeration.
    * - FSC_ERROR_TYPE_COUNT
      - The amount of identifiers in this enumeration.