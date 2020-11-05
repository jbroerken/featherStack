FSC_CSList::GetNext
===================
The GetNext function returns the next card file path in the list.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSList.h


Syntax
------
.. code-block:: c

    std::string GetNext();


Parameters
----------
None.

Return Value
------------
The next UTF-8 card file path to use.

Remarks
-------
* The returned file path is removed from the list.

Code Examples
-------------
None.