FSC_CSList::GetPos
==================
The GetPos function returns a stored card file path based on the index.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSList.h


Syntax
------
.. code-block:: c

    std::string GetPos(size_t us_Card);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - us_Card
      - The card index to get.


Return Value
------------
The UTF-8 card file path requested by index.

Remarks
-------
* The returned file path is removed from storage.

Code Examples
-------------
None.