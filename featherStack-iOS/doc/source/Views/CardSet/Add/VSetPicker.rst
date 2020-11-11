FSSetPickerView
===============
FSSetPickerView displays the OS provided document picker.

File
----
The view definition can be found in the following file:

.. code-block:: c

    View/CardSet/Add/VSetPicker.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../../Functions/View/CardSet/Add/VSetPicker/init>`
      - Internal
    * - :doc:`ImportSet <../../../Functions/View/CardSet/Add/VSetPicker/ImportSet>`
      - Fileprivate
    * - :doc:`documentPicker <../../../Functions/View/CardSet/Add/VSetPicker/documentPicker>`
      - Internal
    * - :doc:`documentPickerWasCancelled <../../../Functions/View/CardSet/Add/VSetPicker/documentPickerWasCancelled>`
      - Internal


Enumerations
------------
None.

Nested
------
None.

Inherited
---------
.. list-table::
    :header-rows: 1

    * - Source
      - Description
    * - UIDocumentPickerViewController
      - The document picker view controller.
      

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - s_AddURL
      - @Binding URL
      - The picked file url to write to.
      - Private
    * - b_Editing
      - @State Bool
      - The currently editing (active) flag.
      - Private


Remarks
-------
None.