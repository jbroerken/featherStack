FSSettingsFile.GetValue
=======================
The GetValue function returns a requested app settings value.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/Settings/MSettingsFile.swift


Syntax
------
.. code-block:: c

    func GetValue(e_Setting: FSSetting) -> Any?


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - e_Setting
      - The :doc:`setting <../../../../Enumerations/Model/Settings/MSettingsFile/FSSetting>` 
        requested.


Return Value
------------
The settings **value** on success, **nil** on failure.

Remarks
-------
None.

Code Examples
-------------
None.