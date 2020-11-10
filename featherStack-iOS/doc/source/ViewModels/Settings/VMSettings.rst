FSSettingsViewModel
===================
FSSettingsViewModel allows for interaction between the various views accessing 
the application settings and the settings file.

File
----
The view model definition can be found in the following file:

.. code-block:: c

    ViewModel/Settings/VMSettings.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../Functions/ViewModel/Settings/VMSettings/init>`
      - Internal
    * - :doc:`../../Functions/ViewModel/Settings/VMSettings/Write`
      - Private


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
    * - ObservableObject
      - View observable parent.
      

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - b_TShowCard
      - @Published Bool
      - The show card tutorial setting.
      - Internal
    * - b_CDSwipeRightCorrect
      - @Published Bool
      - The correct answer swipe direction setting.
      - Internal
    * - b_SClearTextOnNav
      - @Published Bool
      - The clear search text on selection setting.
      - Internal
    * - b_SExactString
      - @Published Bool
      - The exact search text matching setting.
      - Internal
    * - c_File
      - :doc:`FSSettingsFile <../../Models/Settings/MSettingsFile>`
      - The settings file to read from and write to.
      - Private


Remarks
-------
None.