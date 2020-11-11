FSCommon.GetDocumentsPath
=========================
The GetDocumentsPath function returns the full path to the app's documents 
directory.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/MCommon.swift


Syntax
------
.. code-block:: c

    static func GetDocumentsPath(_ s_Append: String? = nil) throws -> String


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Append
      - The string to append to the documents path.


Return Value
------------
The documents path string with appended content if given.

Remarks
-------
* The documents path and appended content will be separated by a '/' 
  character.

Code Examples
-------------
None.