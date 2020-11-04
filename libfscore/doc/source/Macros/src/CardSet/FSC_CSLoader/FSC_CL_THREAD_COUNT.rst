FSC_CL_THREAD_COUNT
===================
The FSC_CL_THREAD_COUNT macro is used to define both the minimal and maximal 
thread count for loading cards.

Header
------
The macro definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Definition
----------
The defined macro is as follows:

.. code-block:: c
  
    #ifndef FSC_CL_THREAD_COUNT
        #define FSC_CL_THREAD_COUNT 1
    #elif FSC_CL_THREAD_COUNT < 0
        #define FSC_CL_THREAD_COUNT 1
    #elif FSC_CL_THREAD_COUNT > 2
        #define FSC_CL_THREAD_COUNT 2
    #endif