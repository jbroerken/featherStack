FSC_ValueFile::Block
====================
The Block class is used to represent a collection of information found in a 
value file.

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
    * - :doc:`Block <../../../../Functions/src/File/FSC_ValueFile/Block/Block>`
      - Public
    * - :doc:`~Block <../../../../Functions/src/File/FSC_ValueFile/Block/~Block>`
      - Public
    * - :doc:`GetValue <../../../../Functions/src/File/FSC_ValueFile/Block/GetValue>`
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
    * - s_Name
      - std::string
      - The UTF-8 block name.
      - Public
    * - v_Value
      - std::list<:doc:`Value <../../../../Types/src/File/FSC_ValueFile/Value>`>
      - The pair vector for storing UTF-8 block values.
      - Public


Remarks
-------
None.