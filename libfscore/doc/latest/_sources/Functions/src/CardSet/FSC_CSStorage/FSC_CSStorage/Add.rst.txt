FSC_CSStorage::Add
==================
The Add function is used to insert an object to store.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Syntax
------
.. code-block:: c

    void Add(FSC_Card*& p_Card);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The object to store.


Return Value
------------
None.

Remarks
-------
* The pointer be set to NULL if the insertion succeeded.
* This function is thread safe.

Code Examples
-------------
None.