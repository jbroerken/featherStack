FSC_ContextOpaque
=================
The FSC_ContextOpaque type is used to return 
:doc:`../../../Structs/src/FSC_ContextData/FSC_Context` 
as a struct with unknown contents to the library user. This allows the structs 
with C++ components to appear as C structs.

Header
------
The type definition can be found in the following file:

.. code-block:: c

    include/FSC_Context.h


Definition
----------
The defined type is as follows:

.. code-block:: c

    typedef struct FSC_Context_t FSC_ContextOpaque;