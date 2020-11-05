FSC_CardSetOpaque
=================
The FSC_CardSetOpaque type is used to return 
:doc:`../../../Structs/src/FSC_CardSetData/FSC_CardSet` 
as a struct with unknown contents to the library user. This allows the structs 
with C++ components to appear as C structs.

Header
------
The type definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Definition
----------
The defined type is as follows:

.. code-block:: c

    typedef struct FSC_CardSet_t FSC_CardSetOpaque;