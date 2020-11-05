FSC_CDGetType
=============
The FSC_CDGetType function returns the card type for a given card.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Card.h


Syntax
------
.. code-block:: c

    int FSC_CDGetType(const FSC_CardOpaque* FSC_NONNULL p_Card);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Card
      - The :doc:`card <../../../Types/include/FSC_Card/FSC_CardOpaque>` to 
        check.


Return Value
------------
The :doc:`card type <../../../Enumerations/include/FSC_Card/FSC_CDType>`.

Remarks
-------
None.

Code Examples
-------------
None.