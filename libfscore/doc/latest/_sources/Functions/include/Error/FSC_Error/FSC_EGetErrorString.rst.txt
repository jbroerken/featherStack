FSC_EGetErrorString
===================
The FSC_EGetErrorString function is used to retrieve the error string for the 
current library error.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/Error/FSC_Error.h


Syntax
------
.. code-block:: c

    const char* FSC_NONNULL FSC_EGetErrorString(void);


Parameters
----------
None.

Return Value
------------
The current error string.

Remarks
-------
* This function is thread safe.

Code Examples
-------------
None.