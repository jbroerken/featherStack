FSC_CSLoader::LoadCard
======================
The LoadCard function is used to add a load job for a given path, callback and  
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
                  FSC_Callback p_Callback, 
                  FSC_Destination p_Destination) noexcept;


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_FilePath
      - The UTF-8 file path of the load request.
    * - p_Callback
      - The :doc:`callback <../../../../../Types/include/FSC_CardSet/FSC_Callback>` 
        to perform after card loading.
    * - p_Destination
      - The :doc:`destination <../../../../../Types/include/FSC_CardSet/FSC_Destination>`
        to hand to the callback.


Return Value
------------
None.

Remarks
-------
* Passing NULL as a callback or destination will add the loaded card directly 
  to cache.
* This function is thread safe.

Code Examples
-------------
None.