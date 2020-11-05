Identifier (FSC_CSLoader)
=========================
The FSC_CSLoader identifier enumeration is used to describe the available 
value identifiers and their index position as well as the last identifier and 
the amount of identifiers.

Header
------
The enumeration definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.cpp


Definition
----------
The defined enumeration values are as follows:

.. code-block:: c

    enum Identifier
    {
        TYPE = 0,
        DATA = 1,
        QUESTION = 2,
        ANSWER = 3,
        
        IDENTIFIER_MAX = ANSWER,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1   
    };


Values
------
The meaning behind the enumeration values is as follows:

.. list-table::
    :header-rows: 1

    * - Enumeration
      - Description
    * - TYPE
      - The card type value identifier index.
    * - DATA
      - The data value identifier index.
    * - QUESTION
      - The question string value identifier index.
    * - ANSWER
      - The answer string value identifier index.
    * - IDENTIFIER_MAX
      - The highest identifier in this enumeration.
    * - IDENTIFIER_COUNT
      - The amount of identifiers in this enumeration.