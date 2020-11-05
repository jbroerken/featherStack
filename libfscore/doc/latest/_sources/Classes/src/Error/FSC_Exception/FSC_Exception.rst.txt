FSC_Exception
=============
The FSC_Exception class is used as a general exception inside the library.

Header
------
The class definition can be found in the following file:

.. code-block:: c

    src/Error/FSC_Exception.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_Exception (std::string) <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/FSC_Exception_0>`
      - Public
    * - :doc:`FSC_Exception (const char*) <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/FSC_Exception_1>`
      - Public
    * - :doc:`~FSC_Exception <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/~FSC_Exception>`
      - Public
    * - :doc:`what <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/what>`
      - Public
    * - :doc:`what2 <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/what2>`
      - Public
    * - :doc:`file <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/file>`
      - Public
    * - :doc:`line <../../../../Functions/src/Error/FSC_Exception/FSC_Exception/line>`
      - Public


Enumerations
------------
None.

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
    * - s_Message
      - std::string
      - The exception description.
      - Private
    * - s_File
      - std::string
      - The exception origin file.
      - Private
    * - us_Line
      - size_t
      - The exception origin file line.
      - Private


Remarks
-------
None.