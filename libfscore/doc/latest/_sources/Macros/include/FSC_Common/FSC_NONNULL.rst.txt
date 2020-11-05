FSC_NONNULL
===========
The FSC_NONNULL macro is used to define that a pointer is never NULL.

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
        #define FSC_NONNULL _Nonnull
    #else
        #define FSC_NONNULL
    #endif  