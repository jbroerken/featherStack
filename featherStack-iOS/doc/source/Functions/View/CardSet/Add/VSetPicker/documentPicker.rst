FSSetPickerView.documentPicker
==============================
The documentPicker function is used to react to the user selecting a document 
in  the document picker.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    View/CardSet/Add/VSetPicker.swift


Syntax
------
.. code-block:: c

    documentPicker(_ controller: UIDocumentPickerViewController, 
                   didPickDocumentsAt urls: [URL])


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - controller
      - The view controller which called.
    * - didPickDocumentsAt
      - All file urls chosen by the user.


Return Value
------------
None.

Remarks
-------
* This function prototype is defined by UIDocumentPickerDelegate.

Code Examples
-------------
None.