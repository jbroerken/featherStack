FSC_CSList
==========
The FSC_CSList class stores all card file paths and helps with returning new 
random cards.

Header
------
The class definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSList.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_CSList (Default) <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/FSC_CSList_0>`
      - Public
    * - :doc:`FSC_CSList (Copy) <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/FSC_CSList_1>`
      - Public
    * - :doc:`~FSC_CSList <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/~FSC_CSList>`
      - Public
    * - :doc:`Scramble <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/Scramble>`
      - Public
    * - :doc:`Add <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/Add>`
      - Public
    * - :doc:`GetPos <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/GetPos>`
      - Public
    * - :doc:`GetNext <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/GetNext>`
      - Public
    * - :doc:`GetCount <../../../../Functions/src/CardSet/FSC_CSList/FSC_CSList/GetCount>`
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
    * - v_List
      - std::vector<std::string>
      - The UTF-8 formatted file paths to the card files.
      - Private


Remarks
-------
None.