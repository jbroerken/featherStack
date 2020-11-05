FSC_ValueFile::FSC_ValueFile
============================
The FSC_ValueFile constructor function is used to construct the 
:doc:`FSC_ValueFile <../../../../../Classes/src/File/FSC_ValueFile/FSC_ValueFile>` 
class.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/File/FSC_ValueFile.h


Syntax
------
.. code-block:: c

    FSC_ValueFile(std::string const& s_FilePath);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_FilePath
      - The UTF-8 path to the file.


Return Value
------------
None.

Remarks
-------
* The constructor will use :doc:`Read <Read>` to initialize the file. 

Code Examples
-------------
None.