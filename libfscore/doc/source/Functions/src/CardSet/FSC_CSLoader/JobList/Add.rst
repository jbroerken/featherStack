FSC_CSLoader::JobList::Add
==========================
The Add function is used to add a new job to the job list.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    void Add(FSC_CardOpaque** const& p_Destination, 
             std::string const& s_FilePath, 
             bool b_Front = false) noexcept;


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
      - The UTF-8 card file path s_FilePath for the new job.
    * - b_Front
      - Wether the job should be inserted on the front or back of the list.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.