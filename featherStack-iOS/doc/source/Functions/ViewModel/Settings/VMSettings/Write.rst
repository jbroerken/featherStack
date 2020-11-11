FSSettingsViewModel.Write
=========================
The Write function is used to update a specific settings value followed by a 
write to the file.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    ViewModel/Settings/VMSettings.swift


Syntax
------
.. code-block:: c

    func Write(e_Setting: FSSettingsFile.FSSetting, 
               a_Value: Any) -> Void


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - e_Setting
      - The :doc:`setting <../../../../Enumerations/Model/Settings/MSettingsFile/FSSetting>` 
        to change.
    * - a_Value
      - The new value for the setting.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.