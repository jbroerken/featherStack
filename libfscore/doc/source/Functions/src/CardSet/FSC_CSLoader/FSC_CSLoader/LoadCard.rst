FSC_CSLoader::LoadCard
======================
The LoadCard function is used to add a load job for a given path and 
destination.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSLoader.h


Syntax
------
.. code-block:: c

    void LoadCard(std::string const& s_FilePath, 
                  FSC_CardOpaque** p_Destination = NULL) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_FilePath
      - The UTF-8 file path of the load request.
    * - p_Destination
      - The :doc:`card <../../../../../Types/include/FSC_CardSet/FSC_CardSetOpaque>` 
        destination.


Return Value
------------
None.

Remarks
-------
* Passing NULL as a destination will add the loaded card directly to cache.
* This function is thread safe.

Code Examples
-------------
None.