FSSettingsFile
==============
The FSSettingsFile model is used to read, store and write app settings.

File
----
The model definition can be found in the following file:

.. code-block:: c

    Model/Settings/MSettingsFile.swift


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`init <../../Functions/Model/Settings/MSettingsFile/init>`
      - Internal
    * - :doc:`../../Functions/Model/Settings/MSettingsFile/Read`
      - Internal
    * - :doc:`../../Functions/Model/Settings/MSettingsFile/Write`
      - Internal
    * - :doc:`../../Functions/Model/Settings/MSettingsFile/GetValue`
      - Internal
    * - :doc:`../../Functions/Model/Settings/MSettingsFile/SetValue`
      - Internal


Enumerations
------------
.. list-table::
    :header-rows: 1

    * - Enumeration
      - Visibility
    * - :doc:`FSError <../../Enumerations/Model/Settings/MSettingsFile/FSError>`
      - Internal
    * - :doc:`FSSetting <../../Enumerations/Model/Settings/MSettingsFile/FSSetting>`
      - Internal


Nested
------
None.

Inherited
---------
None.

Variables
---------
.. list-table::
    :header-rows: 1

    * - Name
      - Type
      - Description
      - Visbility
    * - l_Setting
      - [Any]
      - The current app settings values.
      - Private (Set)


Remarks
-------
None.