FSC_CSStorage::GetPath
======================
The GetPath function returns a element in storage based on the file path.

Header
------
The function definition can be found in the following file:

.. code-block:: c

    src/CardSet/FSC_CSStorage.h


Syntax
------
.. code-block:: c

    FSC_Card* GetPath(std::string const& s_FilePath);


Parameters
----------
.. list-table::
    :header-rows: 1

    * - Parameter
      - Description
    * - s_FilePath
      - The UTF-8 object file path to search for.


Return Value
------------
The :doc:`FSC_Card <../../../../../Structs/src/FSC_CardData/FSC_Card>` object 
requested by file path.

Remarks
-------
* The returned object is removed from storage.
* The oldest object with a matching path will be chosen if multiple exist.
* This function is thread safe.

Code Examples
-------------
None.