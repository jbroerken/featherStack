FSC_CSStorage::GetFull
======================
The GetFull function is used to check if the object storage limit was reached.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Syntax
------
.. code-block:: c

    bool GetFull() noexcept;


Parameters
----------
None.

Return Value
------------
**true** if the storage is full, **false** if not.

Remarks
-------
* This function is thread safe.

Code Examples
-------------
None.