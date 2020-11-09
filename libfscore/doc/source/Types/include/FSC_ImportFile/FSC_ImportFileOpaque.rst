FSC_ImportFileOpaque
=====================
The FSC_ImportFileOpaque type is used to return 
:doc:`../../../Structs/src/FSC_ImportFileData/FSC_ImportFile` 
as a struct with unknown contents to the library user. This allows the structs 
with C++ components to appear as C structs.

Header
------
The type definition can be found in the following file:

.. code-block:: c

    include/FSC_ImportFile.h


Definition
----------
The defined type is as follows:

.. code-block:: c

    typedef struct FSC_ImportFile_t FSC_ImportFileOpaque;