FSC_Entry (struct FSC_Entry_t)
==============================
The FSC_Entry struct stores file and short summary information about a card set 
related to the owning context.

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
    * - :doc:`FSC_Entry_t <../../../Functions/src/FSC_ContextData/FSC_Entry/FSC_Entry_t>`
      - Public
    * - :doc:`~FSC_Entry_t <../../../Functions/src/FSC_ContextData/FSC_Entry/~FSC_Entry_t>`
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
      - The UTF-8 formatted directory path to the card set directory.
      - Public
    * - s_FilePath
      - std::string
      - The UTF-8 formatted file path to the card set file.
      - Public
    * - s_IconPath
      - std::string
      - The UTF-8 formatted file path to the card set icon image.
      - Public
    * - s_Title
      - std::string
      - The UTF-8 formatted card set title.
      - Public
    * - s_Subtitle
      - std::string
      - The UTF-8 formatted card set subtitle.
      - Public


Remarks
-------
* Operator **new** and operator **delete** should be used for this struct due 
  to the use of a constructor and destructor as well as the use of C++ 
  containers.
* This struct will **NOT** be given to the library user at any point.