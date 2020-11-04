FSC_NULLABLE
============
The FSC_NULLABLE macro is used to define that a pointer can be both valid and 
NULL.

Header
------
The macro definition can be found in the following file:

.. code-block:: c

    include/FSC_Common.h


Definition
----------
The defined macro is as follows:

.. code-block:: c

    #ifdef __clang__
        #define FSC_NULLABLE _Nullable
    #else
        #define FSC_NULLABLE
    #endif  