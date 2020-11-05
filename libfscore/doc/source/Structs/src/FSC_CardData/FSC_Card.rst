FSC_Card (struct FSC_Card_t)
============================
The FSC_Card struct stores all data related to a specific card inside a set.

Header
------
The struct definition can be found in the following file:

.. code-block:: c

    src/FSC_CardData.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_Card_t <../../../Functions/src/FSC_CardData/FSC_Card/FSC_Card_t>`
      - Public
    * - :doc:`~FSC_Card_t <../../../Functions/src/FSC_CardData/FSC_Card/~FSC_Card_t>`
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
    * - s_FilePath
      - std::string
      - The UTF-8 formatted file path to the card file.
      - Public
    * - i_CardType
      - int
      - The card type describing the :doc:`type <../../../Enumerations/include/FSC_Card/FSC_CDType>` 
        of the card data.
      - Public
    * - s_Data
      - std::string
      - The UTF-8 formatted string describing the used card data.
      - Public
    * - s_Question
      - std::string
      - The UTF-8 question string for the card.
      - Public
    * - s_Answer
      - std::string
      - The UTF-8 answer string for the card.
      - Public


Remarks
-------
* Operator **new** and operator **delete** should be used for this struct due 
  to the use of a constructor and destructor as well as the use of C++ 
  containers.
* This struct will be given to the library user in the form of 
  :doc:`../../../Types/include/FSC_Card/FSC_CardOpaque`.