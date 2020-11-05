FSC_CSLoader::JobList::Claim
============================
The Claim function is used to store the values of the next available job and to 
remove it from the job list.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    bool Claim(FSC_CardOpaque**& p_Destination, 
               std::string& s_FilePath) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Destination
      - The location of the :doc:`job <../../../../../Types/include/FSC_Card/FSC_CardOpaque>`.
    * - s_FilePath
      - The UTF-8 card file path s_FilePath to use.


Return Value
------------
**true** if a job was claimed, **false** if not.

Remarks
-------
None.

Code Examples
-------------
None.