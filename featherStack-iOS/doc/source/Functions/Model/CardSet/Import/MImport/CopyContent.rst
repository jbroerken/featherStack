FSImport.CopyContent
====================
The CopyContent function is used to copy files and folders.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Syntax
------
.. code-block:: c

    func CopyContent(s_Source: String, s_Destination: String) throws -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Source
      - The path to the source content.
    * - s_Destination
      - The path to the content destination.


Return Value
------------
None.

Remarks
-------
* Missing directory path entries will be created before copying the file or 
  directory.

Code Examples
-------------
None.