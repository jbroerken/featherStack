FSC_CSLoader
============
The FSC_CSLoader class is responsible for background card loading.

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
    * - :doc:`FSC_CSLoader <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/FSC_CSLoader>`
      - Public
    * - :doc:`~FSC_CSLoader <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/~FSC_CSLoader>`
      - Public
    * - :doc:`AddToCache <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/AddToCache>`
      - Public
    * - :doc:`GetCacheSize <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/GetCacheSize>`
      - Public
    * - :doc:`LoadCard <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/LoadCard>`
      - Public
    * - :doc:`GetCacheSize <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/GetCacheSize>`
      - Public
    * - :doc:`ThreadCardSetup <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/ThreadCardSetup>`
      - Private
    * - :doc:`ThreadLoad <../../../../Functions/src/CardSet/FSC_CSLoader/FSC_CSLoader/ThreadLoad>`
      - Private


Enumerations
------------
None.

Nested
------
.. list-table::
    :header-rows: 1

    * - Class
      - Visibility
    * - :doc:`JobList <JobList>`
      - Private


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
    * - v_Thread
      - std::vector<std::thread>
      - The thread storage vector.
      - Private
    * - b_Stop
      - std::atomic<bool>
      - The thread update control flag.
      - Private
    * - c_Condition
      - std::condition_variable
      - The condition used to stall and release threads for available jobs.
      - Private
    * - c_ConditionMutex
      - std::mutex
      - The condition mutex.
      - Private
    * - c_JobList
      - :doc:`JobList <JobList>`
      - The job list containing the current load jobs.
      - Private
    * - c_Cache
      - :doc:`JobList <../FSC_CSStorage/FSC_CSStorage>`
      - The current card storage cache.
      - Private


Remarks
-------
* This class has a deleted copy constructor.