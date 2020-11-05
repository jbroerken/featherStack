FSC_CSGetDirPath
================
The FSC_CSGetDirPath function returns the directory path string for a given 
card set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    const char* FSC_NONNULL FSC_CSGetDirPath(const FSC_CardSetOpaque* FSC_NONNULL p_Set);


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
The UTF-8 directory path string.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.