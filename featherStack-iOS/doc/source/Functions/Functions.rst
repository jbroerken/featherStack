*********
Functions
*********
The list of functions shown here includes information about their use case as 
well as the required parameters and return values. Code examples are given if 
deemed neccessary.

View Functions
--------------
.. toctree::
  :maxdepth: 1

  View/CardSet/SetList/VSetList/init
  View/CardSet/SetList/VSetList/SelectEntry
  View/CardSet/SetList/VSetList/ResetSelection
  View/CardSet/SetList/VSetInfo/init
  View/CardSet/Add/VSetPicker/init
  View/CardSet/Add/VSetPicker/ImportSet
  View/CardSet/Add/VSetPicker/documentPicker
  View/CardSet/Add/VSetPicker/documentPickerWasCancelled
  View/CardSet/ActiveSet/VActiveSet/init
  View/CardSet/ActiveSet/VCard/init
  View/CardSet/ActiveSet/VCard/CardAppear
  View/CardSet/ActiveSet/VCard/FlipCard
  View/CardSet/ActiveSet/VCard/CardDisappear
  View/CardSet/ActiveSet/VCard/ShowTutorial
  View/CardSet/ActiveSet/VCard/GetFlipped
  View/CardSet/ActiveSet/VSetCardsInfo/init
  View/Settings/VSettingsButton/init

View Model Functions
--------------------
.. toctree::
  :maxdepth: 1

  ViewModel/CardSet/SetList/VMSetList/init
  ViewModel/CardSet/SetList/VMSetList/AddSet
  ViewModel/CardSet/SetList/VMSetList/SelectEntry
  ViewModel/CardSet/SetList/VMSetList/GrabSet
  ViewModel/CardSet/SetList/VMSetList/RemoveSet
  ViewModel/CardSet/SetList/VMSetList/GetEntry
  ViewModel/CardSet/ActiveSet/VMActiveSet/deinit
  ViewModel/CardSet/ActiveSet/VMActiveSet/Validate
  ViewModel/CardSet/ActiveSet/VMActiveSet/Invalidate
  ViewModel/CardSet/ActiveSet/VMActiveSet/NextCard
  ViewModel/CardSet/ActiveSet/VMCard/deinit
  ViewModel/CardSet/ActiveSet/VMCard/Validate
  ViewModel/CardSet/ActiveSet/VMCard/Invalidate
  ViewModel/Settings/VMSettings/init
  ViewModel/Settings/VMSettings/Write

Model Functions
---------------
.. toctree::
  :maxdepth: 1

  Model/CardSet/MCard/init
  Model/CardSet/MCard/deinit
  Model/CardSet/MCardSet/init
  Model/CardSet/MCardSet/deinit
  Model/CardSet/MCardSet/LoadCard
  Model/CardSet/MCardSet/DestroyCard
  Model/CardSet/MContext/init
  Model/CardSet/MContext/deinit
  Model/CardSet/MContext/Reload
  Model/CardSet/MContext/CreateSet
  Model/CardSet/MContext/DestroySet
  Model/CardSet/MContext/AddEntry
  Model/CardSet/MContext/AddSet
  Model/CardSet/MContext/RemoveSet
  Model/CardSet/Import/MImport/RemoveContent
  Model/CardSet/Import/MImport/CopyContent
  Model/CardSet/Import/MImport/CopyZip
  Model/CardSet/Import/MImport/ExtractZip
  Model/CardSet/Import/MImport/ImportFailed
  Model/CardSet/Import/MImport/Import
  Model/Settings/MSettingsFile/init
  Model/Settings/MSettingsFile/Read
  Model/Settings/MSettingsFile/Write
  Model/Settings/MSettingsFile/GetValue
  Model/Settings/MSettingsFile/SetValue
  Model/MCommon/init
  Model/MCommon/Log
  Model/MCommon/FileExists
  Model/MCommon/RemoveContent
  Model/MCommon/GetDocumentsPath