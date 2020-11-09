FSC_IF_LINE_MAX
===============
The FSC_IF_LINE_MAX macro is used to define the maximum read line count in a 
import file.

Header
------
The macro definition can be found in the following file:

.. code-block:: c

    src/FSC_ImportFile.cpp


Definition
----------
The defined macro is as follows:

.. code-block:: c
  
    #ifndef FSC_IF_LINE_MAX
        #define FSC_IF_LINE_MAX                             500
    #elif FSC_IF_LINE_MAX <= 0
        #define FSC_IF_LINE_MAX                             3 // Min, Name Dir and 1 file
    #elif FSC_IF_LINE_MAX > 500
        #define FSC_IF_LINE_MAX                             500
    #endif