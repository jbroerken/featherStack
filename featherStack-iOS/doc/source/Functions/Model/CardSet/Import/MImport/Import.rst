FSImport.Import
===============
The Import function is used to manage file importing for a given .zip file.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/CardSet/Import/MImport.swift


Syntax
------
.. code-block:: c

    func Import(p_Context: FSContext.CContext, 
                s_ZipURL: URL) throws -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Content
      - The :doc:`context <../../../../../Types/Model/CardSet/MContext/CContext>`
        to import into.
    * - s_ZipURL
      - The url path to the source zip file.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.