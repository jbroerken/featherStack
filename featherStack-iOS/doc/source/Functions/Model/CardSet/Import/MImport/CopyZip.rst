FSImport.CopyZip
================
The CopyZip function creates a copy of the specified .zip file in a standard 
location.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Syntax
------
.. code-block:: c

    func CopyZip(_ s_ZipURL: URL) throws -> URL


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_ZipURL
      - The url path to the source zip file.


Return Value
------------
* The url path to the copied zip file.

Remarks
-------
* A zip file already in place will be removed before copying.

Code Examples
-------------
None.