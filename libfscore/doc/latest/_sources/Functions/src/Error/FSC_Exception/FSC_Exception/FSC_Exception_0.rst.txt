FSC_Exception::FSC_Exception (std::string)
==========================================
The FSC_Exception std::string constructor function is used to construct the 
:doc:`FSC_Exception <../../../../../Classes/src/Error/FSC_Exception/FSC_Exception>` 
class.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/Error/FSC_Exception.h


Syntax
------
.. code-block:: c

    FSC_Exception(std::string const& s_Message,
                  const char* p_File,
                  size_t us_Line);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_Message
      - The exception information.
    * - p_File
      - The exception origin file.
    * - us_Line
      - The exception origin file line.


Return Value
------------
None.

Remarks
-------
* No exception is thrown even though the constructor is not marked noexcept.

Code Examples
-------------
None.