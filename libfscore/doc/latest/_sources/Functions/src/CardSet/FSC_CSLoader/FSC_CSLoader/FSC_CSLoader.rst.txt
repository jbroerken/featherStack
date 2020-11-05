FSC_CSLoader::FSC_CSLoader
==========================
The FSC_CSLoader constructor function is used to construct the 
:doc:`FSC_CSLoader <../../../../../Classes/src/CardSet/FSC_CSLoader/FSC_CSLoader>` 
class.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

     FSC_CSLoader(size_t us_CacheLimit);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - us_CacheLimit
      - The card storage chache limit.


Return Value
------------
None.

Remarks
-------
* The constructor will add empty pre-allocated cards to the cache equal to the 
  cache limit.

Code Examples
-------------
None.