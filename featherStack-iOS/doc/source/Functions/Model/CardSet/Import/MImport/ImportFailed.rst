FSImport.ImportFailed
=====================
The ImportFailed function logs and re-throws an error. It also removes a given 
item at a specified path if wanted.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Syntax
------
.. code-block:: c

    func ImportFailed(e_Error: FSError, 
                      s_Remove: String? = nil) -> FSError


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - e_Error
      - The :doc:`FSError <../../../../../Enumerations/Model/CardSet/Import/MImport/FSError>`
        to throw.
    * - s_Remove
      - The path to the content to remove.


Return Value
------------
* The given error to throw.

Remarks
-------
None.

Code Examples
-------------
None.