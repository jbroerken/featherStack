FSC_CSGrabCard
==============
The FSC_CSGrabCard function is used to get a random card from the set.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_CardSet.h


Syntax
------
.. code-block:: c

    void FSC_CSGrabCard(FSC_CardSetOpaque* FSC_NONNULL p_Set, 
                        FSC_Callback FSC_NULLABLE p_Callback, 
                        FSC_Destination FSC_NULLABLE p_Destination);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` 
        to grab from.
    * - p_Callback
      - The :doc:`callback <../../../Types/include/FSC_CardSet/FSC_Callback>` 
        to perform after loading.
    * - p_Destination
      - The :doc:`destination <../../../Types/include/FSC_CardSet/FSC_Destination>` 
        to hand to the callback.


Return Value
------------
None.

Remarks
-------
* The current address on the given destination will not be freed.
* Passing NULL for either the callback or destination will cause the callback 
  to be ignored. The card then will be added to the cache directly.

Code Examples
-------------
None.