FSC_Callback
============
The FSC_Callback type defines the format of the callback function used to 
update the current card of the library user.

Header
------
The type definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Definition
----------
The defined type is as follows:

.. code-block:: c

    typedef void (*FSC_Callback)(FSC_CardOpaque* FSC_NULLABLE p_Source, 
                                 FSC_CardOpaque* FSC_NULLABLE * FSC_NULLABLE p_Destination);