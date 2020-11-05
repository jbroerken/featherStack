FSC_EGetError
=============
The FSC_EGetError function is used to retrieve the current library error.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/Error/FSC_Error.h


Syntax
------
.. code-block:: c

    FSC_Error FSC_EGetError(void);


Parameters
----------
None.

Return Value
------------
The current :doc:`error <../../../../Enumerations/include/Error/FSC_Error/FSC_Error>`.

Remarks
-------
* This function is thread safe.

Code Examples
-------------
None.