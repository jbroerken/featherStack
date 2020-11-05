FSC_CardSet::FSC_CardSet_t
==========================
The FSC_CardSet_t constructor function is used to construct the 
:doc:`FSC_CardSet <../../../../Structs/src/FSC_CardSetData/FSC_CardSet>` struct.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_CardSetData.h


Syntax
------
.. code-block:: c

    FSC_CardSet_t(std::string const& s_DirPath,
                  std::string const& s_FilePath,
                  std::string const& s_Title,
                  size_t us_CacheLimit);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_DirPath
      - The UTF-8 card set directory path.
    * - s_FilePath
      - The UTF-8 card set file path.
    * - s_Title
      - The UTF-8 card set title.
    * - us_CacheLimit
      - The maximum amount of cards stored at a given time.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.