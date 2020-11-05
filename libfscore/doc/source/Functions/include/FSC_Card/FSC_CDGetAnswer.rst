FSC_CDGetAnswer
===============
The FSC_CDGetAnswer function returns the card answer string for a given card.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    include/FSC_Card.h


Syntax
------
.. code-block:: c

    const char* FSC_NONNULL FSC_CDGetAnswer(const FSC_CardOpaque* FSC_NONNULL p_Card);


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
The UTF-8 answer string.

Remarks
-------
* The returned string is always null terminated.

Code Examples
-------------
None.