FSC_CSLoader::JobList
=====================
The JobList class is used to store requested card load jobs and hand them to 
the threaded loaders.

Header
------
The class definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Functions
---------
.. list-table::
    :header-rows: 1

    * - Function
      - Visibility
    * - :doc:`JobList <../../../../Functions/src/CardSet/FSC_CSLoader/JobList/JobList>`
      - Public
    * - :doc:`~JobList <../../../../Functions/src/CardSet/FSC_CSLoader/JobList/~JobList>`
      - Public
    * - :doc:`Add <../../../../Functions/src/CardSet/FSC_CSLoader/JobList/Add>`
      - Public
    * - :doc:`Claim <../../../../Functions/src/CardSet/FSC_CSLoader/JobList/Claim>`
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
    * - c_Mutex
      - std::mutex
      - The job list thread safety mutex.
      - Private
    * - l_Job
      - std::list<std::pair<:doc:`FSC_CardOpaque** <../../../../Types/include/FSC_Card/FSC_CardOpaque>`, std::string>>
      - The pair vector for storing job paths and their destination address.
      - Private


Remarks
-------
* This class can only be created by its outer class, 
  :doc:`FSC_CSLoader <FSC_CSLoader>`.