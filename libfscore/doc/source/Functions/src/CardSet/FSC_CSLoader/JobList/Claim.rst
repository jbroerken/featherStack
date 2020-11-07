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

    bool Claim(FSC_Callback& p_Callback, 
               FSC_Destination& p_Destination, 
               std::string& s_FilePath) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Callback
      - The :doc:`callback <../../../../../Types/include/FSC_CardSet/FSC_Callback>`
        to perform.
    * - p_Destination
      - The :doc:`destination <../../../../../Types/include/FSC_CardSet/FSC_Destination>`
        to hand to the callback.
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