FSC_CSStorage::GetStorageLimit
==============================
The GetStorageLimit function returns the maximum amount of objects storable at 
a given time.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Syntax
------
.. code-block:: c

    size_t GetStorageLimit() noexcept;


Parameters
----------
None.

Return Value
------------
The maximum amount of objects storeable.

Remarks
-------
* This function is thread safe.

Code Examples
-------------
None.