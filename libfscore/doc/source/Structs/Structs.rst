*******
Structs
*******
The list of structs shown here includes information about their use case as 
well as their functions, values and inheritance and visibility.

Internal structs are used by the library itself. These structs are not meant to 
be used directly for app development.

The **card, card set and context structs** are listed as internal even though 
their pointers will be given to the library user. The listing is like that 
because the library user recieves an opaque pointer type.

Library Structs
---------------
This library has no structs accessible from the outside.

Internal Structs
----------------
.. toctree::
  :maxdepth: 1

  src/FSC_CardData/FSC_Card
  src/FSC_CardSetData/FSC_CardSet
  src/FSC_ImportFileData/FSC_ImportFile
  src/FSC_ContextData/FSC_Context
  src/FSC_ContextData/FSC_Entry