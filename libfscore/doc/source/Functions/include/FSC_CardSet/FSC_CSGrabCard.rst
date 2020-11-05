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
                        FSC_CardOpaque* FSC_NULLABLE * FSC_NULLABLE p_Destination);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Set
      - The :doc:`card set <../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` 
        to grab from.
    * - p_Destination
      - The :doc:`card <../../../Types/include/FSC_Card/FSC_CardOpaque>` 
        destination to write to.


Return Value
------------
None.

Remarks
-------
* The current address on the given destination will not be freed.

Code Examples
-------------
None.