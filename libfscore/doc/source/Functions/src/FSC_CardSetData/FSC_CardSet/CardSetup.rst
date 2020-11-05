FSC_CardSet_t::CardSetup
========================
The CardSetup function is used to set the card counters and preload cards if 
possible. The current card list is also scrambled.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_CardSetData.h


Syntax
------
.. code-block:: c

    void CardSetup() noexcept;


Parameters
----------
None.

Return Value
------------
None.

Remarks
-------
* A preload exception will be caught by this function itself. The card set will 
  then operate as if no cards were preloaded.

Code Examples
-------------
None.