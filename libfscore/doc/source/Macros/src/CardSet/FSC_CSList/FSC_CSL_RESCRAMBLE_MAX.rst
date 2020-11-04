FSC_CSL_RESCRAMBLE_MAX
======================
The FSC_CSL_RESCRAMBLE_MAX macro defines both the minimal and maximal amount of 
scramble attempts in order to make sure that the next card to return is not the 
same as the card last returned.

Header
------
The macro definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSList.h


Definition
----------
The defined macro is as follows:

.. code-block:: c

    #ifndef FSC_CSL_RESCRAMBLE_MAX
        #define FSC_CSL_RESCRAMBLE_MAX 3
    #elif FSC_CSL_RESCRAMBLE_MAX < 0 || FSC_CSL_RESCRAMBLE_MAX > 255
        #define FSC_CSL_RESCRAMBLE_MAX 3
    #endif