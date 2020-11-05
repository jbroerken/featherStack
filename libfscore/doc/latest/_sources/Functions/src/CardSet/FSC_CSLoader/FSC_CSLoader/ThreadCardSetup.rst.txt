FSC_CSLoader::TreadCardSetup
============================
The TreadCardSetup function is used by the loader threads to initialize a card 
with file values.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    static void ThreadCardSetup(FSC_Card* p_Card, 
                                std::string const& s_FilePath);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The :doc:`card <../../../../../Structs/src/FSC_CardData/FSC_Card>` to 
        intialize.
    * - s_FilePath
      - The UTF-8 file path to load.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.