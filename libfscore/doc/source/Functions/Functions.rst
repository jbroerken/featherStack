*********
Functions
*********
The list of functions shown here includes information about their use case as 
well as the required parameters and return values. Code examples are given if 
deemed neccessary.

Internal functions are used by the library itself. These functions are not 
meant to be used directly for app development.

Library Functions
-----------------
.. toctree::
  :maxdepth: 1

  include/FSC_Card/FSC_CDGetType
  include/FSC_Card/FSC_CDGetData
  include/FSC_Card/FSC_CDGetQuestion
  include/FSC_Card/FSC_CDGetAnswer
  include/FSC_CardSet/FSC_CSGrabCard
  include/FSC_CardSet/FSC_CSReturnCard
  include/FSC_CardSet/FSC_CSGetTitle
  include/FSC_CardSet/FSC_CSGetTotalCount
  include/FSC_CardSet/FSC_CSGetRemainingCount
  include/FSC_CardSet/FSC_CSGetFinished
  include/FSC_CardSet/FSC_CSGetDirPath
  include/FSC_ImportFile/FSC_IFCreate
  include/FSC_ImportFile/FSC_IFDestroy
  include/FSC_ImportFile/FSC_IFGetSetFile
  include/FSC_ImportFile/FSC_IFGetDirName
  include/FSC_ImportFile/FSC_IFGetFileCount
  include/FSC_ImportFile/FSC_IFGetFilePath
  include/FSC_Context/FSC_COCreate
  include/FSC_Context/FSC_CODestroy
  include/FSC_Context/FSC_COCreateSet
  include/FSC_Context/FSC_CODestroySet
  include/FSC_Context/FSC_COAddSet
  include/FSC_Context/FSC_CORemoveSet
  include/FSC_Context/FSC_COGetSetCount
  include/FSC_Context/FSC_COGetSetTitle
  include/FSC_Context/FSC_COGetSetSubtitle
  include/FSC_Context/FSC_COGetSetDirPath
  include/FSC_Context/FSC_COGetSetFilePath
  include/FSC_Context/FSC_COGetSetIconPath
  include/Error/FSC_Error/FSC_EReset
  include/Error/FSC_Error/FSC_EGetError
  include/Error/FSC_Error/FSC_EGetErrorString

Internal Functions
------------------
.. toctree::
  :maxdepth: 1

  src/FSC_CardData/FSC_Card/FSC_Card_t
  src/FSC_CardData/FSC_Card/~FSC_Card_t
  src/FSC_CardSetData/FSC_CardSet/FSC_CardSet_t
  src/FSC_CardSetData/FSC_CardSet/~FSC_CardSet_t
  src/FSC_CardSetData/FSC_CardSet/Reload
  src/FSC_CardSetData/FSC_CardSet/CardSetup
  src/FSC_ImportFileData/FSC_ImportFile/FSC_ImportFile_t
  src/FSC_ImportFileData/FSC_ImportFile/~FSC_ImportFile_t
  src/FSC_ContextData/FSC_Context/FSC_Context_t
  src/FSC_ContextData/FSC_Context/~FSC_Context_t
  src/FSC_ContextData/FSC_Entry/FSC_Entry_t
  src/FSC_ContextData/FSC_Entry/~FSC_Entry_t
  src/FSC_CardData/FSC_CDUsable
  src/FSC_CardSetData/FSC_CSUsable
  src/FSC_ImportFile/FSC_IFGetValue
  src/FSC_ImportFile/FSC_IFUsable
  src/FSC_Context/FSC_COGetEntry
  src/CardSet/FSC_CSStorage/FSC_CSStorage/FSC_CSStorage
  src/CardSet/FSC_CSStorage/FSC_CSStorage/~FSC_CSStorage
  src/CardSet/FSC_CSStorage/FSC_CSStorage/Add
  src/CardSet/FSC_CSStorage/FSC_CSStorage/GetStorageLimit
  src/CardSet/FSC_CSStorage/FSC_CSStorage/GetCount
  src/CardSet/FSC_CSStorage/FSC_CSStorage/GetFull
  src/CardSet/FSC_CSStorage/FSC_CSStorage/GetNext
  src/CardSet/FSC_CSStorage/FSC_CSStorage/GetPath
  src/CardSet/FSC_CSLoader/FSC_CSLoader/FSC_CSLoader
  src/CardSet/FSC_CSLoader/FSC_CSLoader/~FSC_CSLoader
  src/CardSet/FSC_CSLoader/FSC_CSLoader/AddToCache
  src/CardSet/FSC_CSLoader/FSC_CSLoader/LoadCard
  src/CardSet/FSC_CSLoader/FSC_CSLoader/GetCacheSize
  src/CardSet/FSC_CSLoader/FSC_CSLoader/ThreadCardSetup
  src/CardSet/FSC_CSLoader/FSC_CSLoader/ThreadLoad
  src/CardSet/FSC_CSLoader/JobList/JobList
  src/CardSet/FSC_CSLoader/JobList/~JobList
  src/CardSet/FSC_CSLoader/JobList/Add
  src/CardSet/FSC_CSLoader/JobList/Claim
  src/CardSet/FSC_CSList/FSC_CSList/FSC_CSList_0
  src/CardSet/FSC_CSList/FSC_CSList/FSC_CSList_1
  src/CardSet/FSC_CSList/FSC_CSList/~FSC_CSList
  src/CardSet/FSC_CSList/FSC_CSList/Scramble
  src/CardSet/FSC_CSList/FSC_CSList/Add
  src/CardSet/FSC_CSList/FSC_CSList/GetPos
  src/CardSet/FSC_CSList/FSC_CSList/GetNext
  src/CardSet/FSC_CSList/FSC_CSList/GetCount
  src/File/FSC_ValueFile/FSC_ValueFile/FSC_ValueFile
  src/File/FSC_ValueFile/FSC_ValueFile/~FSC_ValueFile
  src/File/FSC_ValueFile/FSC_ValueFile/Read
  src/File/FSC_ValueFile/FSC_ValueFile/Write
  src/File/FSC_ValueFile/FSC_ValueFile/GetValue
  src/File/FSC_ValueFile/FSC_ValueFile/IsBlockStart
  src/File/FSC_ValueFile/FSC_ValueFile/IsBlockEnd
  src/File/FSC_ValueFile/FSC_ValueFile/ReadValue
  src/File/FSC_ValueFile/Block/Block
  src/File/FSC_ValueFile/Block/~Block
  src/File/FSC_ValueFile/Block/GetValue
  src/Error/FSC_Exception/FSC_Exception/FSC_Exception_0
  src/Error/FSC_Exception/FSC_Exception/FSC_Exception_1
  src/Error/FSC_Exception/FSC_Exception/~FSC_Exception
  src/Error/FSC_Exception/FSC_Exception/what
  src/Error/FSC_Exception/FSC_Exception/what2
  src/Error/FSC_Exception/FSC_Exception/file
  src/Error/FSC_Exception/FSC_Exception/line
  src/Error/FSC_ErrorInternal/FSC_ESetError