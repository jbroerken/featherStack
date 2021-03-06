FSC_CSGetTitle
==============
The FSC_CSGetTitle function returns the title string for a given card set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    const char* FSC_NULLABLE FSC_CSGetTitle(const FSC_CardSetOpaque* FSC_NONNULL p_Set);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` to 
        check.


Return Value
------------
The UTF-8 title string.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.