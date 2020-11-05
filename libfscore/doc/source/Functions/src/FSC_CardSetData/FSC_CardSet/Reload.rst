FSC_CardSet_t::Reload
=====================
The Reload function is used to reinitialize the card set, allowing it to be 
reused for a new request.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_CardSetData.h


Syntax
------
.. code-block:: c

    void Reload(std::string const& s_DirPath, 
                std::string const& s_FilePath, 
                std::string const& s_Title);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_DirPath
      - The new UTF-8 card set directory path.
    * - s_FilePath
      - The new UTF-8 card set file path.
    * - s_Title
      - The new UTF-8 card set title.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.