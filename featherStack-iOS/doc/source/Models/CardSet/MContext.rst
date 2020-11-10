FSContext
=========
The FSContext model is used to interact with the fscore context.

File
----
The model definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MContext.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../Functions/Model/CardSet/MContext/init>`
      - Internal
    * - :doc:`deinit <../../Functions/Model/CardSet/MContext/deinit>`
      - Internal
    * - :doc:`../../Functions/Model/CardSet/MContext/CreateSet`
      - Internal
    * - :doc:`../../Functions/Model/CardSet/MContext/DestroySet`
      - Internal
    * - :doc:`../../Functions/Model/CardSet/MContext/AddEntry`
      - Private
    * - :doc:`../../Functions/Model/CardSet/MContext/AddSet`
      - Internal
    * - :doc:`../../Functions/Model/CardSet/MContext/RemoveSet`
      - Internal


Enumerations
------------
.. list-table::
    :header-rows: 1

    * - Enumeration
      - Visibility
    * - :doc:`FSError <../../Enumerations/Model/CardSet/MContext/FSError>`
      - Internal


Nested
------
.. list-table::
    :header-rows: 1

    * - Name
      - Visibility
    * - FSEntry
      - Internal


Inherited
---------
.. list-table::
    :header-rows: 1

    * - Parent
      - Description
    * - :doc:`Import/MImport`
      - The set import definition.


Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - l_SetEntry
      - [FSEntry]
      - The set entries for the current context.
      - Private (Set)
    * - p_Context
      - :doc:`../../Types/Model/CardSet/MContext/CContext`?
      - The library context pointer in use.
      - Private


Remarks
-------
None.