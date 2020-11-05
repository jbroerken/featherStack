FSC_CSStorage
=============
The FSC_CSStorage class acts as a cache to allow thread safe card storage and 
retrieval with automatic cleanup.

Header
------
The class definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_CSStorage <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/FSC_CSStorage>`
      - Public
    * - :doc:`~FSC_CSStorage <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/~FSC_CSStorage>`
      - Public
    * - :doc:`Add <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/Add>`
      - Public
    * - :doc:`GetStorageLimit <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/GetStorageLimit>`
      - Public
    * - :doc:`GetCount <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/GetCount>`
      - Public
    * - :doc:`GetFull <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/GetFull>`
      - Public
    * - :doc:`GetNext <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/GetNext>`
      - Public
    * - :doc:`GetPath <../../../../Functions/src/CardSet/FSC_CSStorage/FSC_CSStorage/GetPath>`
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
    * - c_Mutex
      - std::mutex
      - The storage mutex for thread safety.
      - Private
    * - v_List
      - std::vector<:doc:`FSC_Card* <../../../../Structs/src/FSC_CardData/FSC_Card>`>
      - The currently stored cards.
      - Private
    * - us_StorageLimit
      - size_t
      - The maximal amount of cards stored at a time.
      - Private
    * - us_Reserve
      - size_t
      - The vector reserve capacity increase.
      - Private


Remarks
-------
* This class has a deleted copy constructor.