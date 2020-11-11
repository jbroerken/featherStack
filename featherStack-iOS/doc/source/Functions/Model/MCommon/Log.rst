FSCommon.Log
============
The Log function logs a message with to the caller unknown methods.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    Model/MCommon.swift


Syntax
------
.. code-block:: c

    static func Log(_ s_String: String) -> Void {


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_String
      - The string to log.


Return Value
------------
None.

Remarks
-------
* Logging is performed with NSLog.
* Logging will only be performed in a debug build environment.

Code Examples
-------------
None.