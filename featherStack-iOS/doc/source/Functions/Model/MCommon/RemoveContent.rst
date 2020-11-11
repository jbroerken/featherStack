FSCommon.RemoveContent
======================
The RemoveContent function is used to remove a file or directory.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/MCommon.swift


Syntax
------
.. code-block:: c

    static func RemoveContent(_ s_FilePath: String) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_FilePath
      - The path to the item to remove.


Return Value
------------
None.

Remarks
-------
* This function will check if the file exists before attempting to remove.

Code Examples
-------------
None.