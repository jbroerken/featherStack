FSC_Context_t::FSC_Context_t
============================
The FSC_Context_t constructor function is used to construct the 
:doc:`FSC_Context <../../../../Structs/src/FSC_ContextData/FSC_Context>` struct.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/FSC_ContextData.h


Syntax
------
.. code-block:: c

    FSC_Context_t(std::string const& s_DirPath,
                  std::string const& s_FilePath,
                  size_t us_CacheLimit) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_DirPath
      - The UTF-8 context directory path.
    * - s_FilePath
      - The UTF-8 context file path.
    * - us_CacheLimit
      - The cache limit to set for newly created card sets.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.