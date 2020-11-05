FSC_CSLoader::AddToCache
========================
The AddToCache function is used to add (return) an allocated card to the cache.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    void AddToCache(FSC_Card*& p_Card) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The :doc:`card <../../../../../Structs/src/FSC_CardData/FSC_Card>` to add.


Return Value
------------
None.

Remarks
-------
* The state of the referenced pointer is dependent on the used 
  :doc:`add <../../FSC_CSStorage/FSC_CSStorage/Add>` function.
* This function is thread safe.

Code Examples
-------------
None.