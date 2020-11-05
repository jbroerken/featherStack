FSC_ESetError
=============
The FSC_ESetError function is used to set the current library error.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/Error/FSC_ErrorInternal.cpp


Syntax
------
.. code-block:: c

    void FSC_ESetError(FSC_Error e_Error);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - e_Error
      - The new :doc:`error <../../../../Enumerations/include/Error/FSC_Error/FSC_Error>`.


Return Value
------------
None.

Remarks
-------
* This function is thread safe.

Code Examples
-------------
None.