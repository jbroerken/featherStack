FSC_CardOpaque
==============
The FSC_CardOpaque type is used to return 
:doc:`../../../Structs/src/FSC_CardData/FSC_Card` 
as a struct with unknown contents to the library user. This allows the structs 
with C++ components to appear as C structs.

Header
------
The type definition can be found in the following file:

.. code-block:: c

    include/FSC_Card.h


Definition
----------
The defined type is as follows:

.. code-block:: c

    typedef struct FSC_Card_t FSC_CardOpaque;