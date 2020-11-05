FSC_CSStorage::GetNext
======================
The GetNext function returns the oldest element in storage.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Syntax
------
.. code-block:: c

    FSC_Card* GetNext();


Parameters
----------
None.

Return Value
------------
The oldest :doc:`FSC_Card <../../../../../Structs/src/FSC_CardData/FSC_Card>` 
object.

Remarks
-------
* The returned object is removed from storage.
* This function is thread safe.

Code Examples
-------------
None.