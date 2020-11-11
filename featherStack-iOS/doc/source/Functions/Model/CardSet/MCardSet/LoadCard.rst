FSCardSet.LoadCard
==================
The LoadCard function is used to request a card load by waiting for a threaded 
loading operation to complete.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/MCardSet.swift


Syntax
------
.. code-block:: c

    func LoadCard(_ p_Location: CCardLocation) throws -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Location
      - The :doc:`location <../../../../Types/Model/CardSet/MCardSet/CCardLocation>` 
        to write the card pointer to.


Return Value
------------
None.

Remarks
-------
* Make sure to keep the location given valid.
* This function will not block until the card is loaded.

Code Examples
-------------
None.