********
Building
********
Building featherStack-iOS follows the same procedure as most smaller apps:
simply add the required dependencies and execute the build process with Xcode.
Nothing like CocoaPods or similar is required.

Supported Platforms
-------------------
featherStack-iOS is, like the name suggest, intended for Apple's family of 
devices running iOS: The iPhone, iPod Touch and iPad. Please note that there is 
no specific iPad version, the App will simply be scaled.

Dependencies
------------
The app relies on two components to function properly:

* libfscore
* Zip

The libfscore dependency can be built from the project files included in the 
repository. The Zip framework has to be aquired at https://github.com/marmelroy/Zip.

Build Tools
-----------
This release includes a Xcode library project for a the build process. The 
minimal required version for Xcode is 12.1 (iOS 14.1 SDK).

Build Process
-------------
The build process should be relatively straightforward:

1. Aquire the dependencies.
2. Add the dependencies in the required locations.
3. Open the Xcode project found in the "build" folder.
4. Select your architecture (Simulator, Intel or ARM Native)
5. Build the Project.