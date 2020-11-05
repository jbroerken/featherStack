FSC_ValueFile
=============
The FSC_ValueFile class is responsible for reading, writing and storing value 
file data in a mostly loose format.

Header
------
The class definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`FSC_ValueFile <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/FSC_ValueFile>`
      - Public
    * - :doc:`~FSC_ValueFile <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/~FSC_ValueFile>`
      - Public
    * - :doc:`Read <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/Read>`
      - Public
    * - :doc:`Write <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/Write>`
      - Public
    * - :doc:`GetValue <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/GetValue>`
      - Public
    * - :doc:`IsBlockStart <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/IsBlockStart>`
      - Public
    * - :doc:`IsBlockEnd <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/IsBlockEnd>`
      - Public
    * - :doc:`ReadValue <../../../../Functions/src/File/FSC_ValueFile/FSC_ValueFile/ReadValue>`
      - Public


Enumerations
------------
None.

Nested
------
.. list-table::
    :header-rows: 1

    * - Class
      - Visibility
    * - :doc:`Block <Block>`
      - Public


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
    * - v_Block
      - std::vector<:doc:`Block <Block>`>
      - The blocks stored in this value file.
      - Public


Remarks
-------
None.