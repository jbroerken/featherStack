FSC_CardSet (struct FSC_CardSet_t)
==================================
The FSC_CardSet struct stores all data related to a specific card set as well 
as the card set loader for this set instance.

Header
------
The struct definition can be found in the following file:

.. code-block:: c

    src/FSC_CardSetData.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_CardSet_t <../../../Functions/src/FSC_CardSetData/FSC_CardSet/FSC_CardSet_t>`
      - Public
    * - :doc:`~FSC_CardSet_t <../../../Functions/src/FSC_CardSetData/FSC_CardSet/~FSC_CardSet_t>`
      - Public
    * - :doc:`Reload <../../../Functions/src/FSC_CardSetData/FSC_CardSet/Reload>`
      - Public
    * - :doc:`CardSetup <../../../Functions/src/FSC_CardSetData/FSC_CardSet/CardSetup>`
      - Private


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
    * - s_DirPath
      - std::string
      - The UTF-8 formatted directory path to the card set.
      - Public
    * - s_Title
      - std::string
      - The UTF-8 formatted card set title.
      - Public
    * - us_CardCountTotal
      - size_t
      - The total amount of cards in this set.
      - Public
    * - us_CardCountRemaining
      - size_t
      - The amount of cards in this set still waiting to be completed.
      - Public
    * - c_Loader
      - :doc:`../../../Classes/src/CardSet/FSC_CSLoader/FSC_CSLoader`
      - The card loader instance for this card set.
      - Public
    * - c_List
      - :doc:`../../../Classes/src/CardSet/FSC_CSList/FSC_CSList`
      - The card list instance for this card set.
      - Public


Remarks
-------
* Operator **new** and operator **delete** should be used for this struct due 
  to the use of a constructor and destructor as well as the use of C++ 
  containers.
* This struct will be given to the library user in the form of 
  :doc:`../../../Types/include/FSC_CardSet/FSC_CardSetOpaque`.
* Loader and List instances are **NOT** shared! Each set has it's own instance
  of both, with each loader having a set of threads belonging to itself alone.