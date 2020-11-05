FSC_Context (struct FSC_Context_t)
==================================
The FSC_Context struct stores all data related to a specific context.

Header
------
The struct definition can be found in the following file:

.. code-block:: c

    src/FSC_ContextData.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_Context_t <../../../Functions/src/FSC_ContextData/FSC_Context/FSC_Context_t>`
      - Public
    * - :doc:`~FSC_Context_t <../../../Functions/src/FSC_ContextData/FSC_Context/~FSC_Context_t>`
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
    * - s_DirPath
      - std::string
      - The UTF-8 formatted directory path to the context directory.
      - Public
    * - s_FilePath
      - std::string
      - The UTF-8 formatted file path to the context file.
      - Public
    * - us_CacheLimit
      - size_t
      - The maximum amount of cards stored in a cache at a given time.
      - Public
    * - v_List
      - std::vector<:doc:`FSC_Entry <FSC_Entry>`>
      - The vector storage for all card set entries.
      - Public
    * - p_Set
      - :doc:`../FSC_CardSetData/FSC_CardSet`
      - The currently stored card set to overwrite and return on request.
      - Public


Remarks
-------
* Operator **new** and operator **delete** should be used for this struct due 
  to the use of a constructor and destructor as well as the use of C++ 
  containers.
* This struct will be given to the library user in the form of 
  :doc:`../../../Types/include/FSC_Context/FSC_ContextOpaque`.