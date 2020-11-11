FSImport.RemoveContent
======================
The RemoveContent function is used to delete files and folders.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Syntax
------
.. code-block:: c

    func RemoveContent(_ s_Path: String) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Path
      - The path to the content.


Return Value
------------
None.

Remarks
-------
* This function will check if the content exists before attempting to delete it.

Code Examples
-------------
None.