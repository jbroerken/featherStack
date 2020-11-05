FSC_CSLoader::GetCacheSize
==========================
The GetCacheSize function is used to return the storage cache size.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    size_t GetCacheSize() noexcept;


Parameters
----------
None.

Return Value
------------
The storage cache size.

Remarks
-------
* The result is dependent on the used cache size
  :doc:`getter <../../FSC_CSStorage/FSC_CSStorage/GetStorageLimit>` function.
* This function is thread safe.

Code Examples
-------------
None.