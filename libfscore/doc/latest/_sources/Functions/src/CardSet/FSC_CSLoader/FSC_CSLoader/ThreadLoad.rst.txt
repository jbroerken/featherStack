FSC_CSLoader::ThreadLoad
========================
The ThreadLoad function is used by the loader threads to react to incoming load 
jobs.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    static void ThreadLoad(FSC_CSLoader* p_Instance) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - p_Instance
      - The :doc:`loader <../../../../../Classes/src/CardSet/FSC_CSLoader/FSC_CSLoader>` 
        instance to use.


Return Value
------------
None.

Remarks
-------
None.

Code Examples
-------------
None.