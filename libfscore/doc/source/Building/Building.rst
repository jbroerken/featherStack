********
Building
********
The project files are already prepared, no 3rd party dependencies are currently 
in use. The currently included projects are for the Xcode editor. Other 
projects for library building processes can easily be added, such as CMake.

Supported Platforms
-------------------
libfscore is intended for mobile platforms like iOS and Android but also 
supports all mainstream Unix-likes (macOS, Linux). You might run into problems 
when using the library on Windows due to the path structure used.
The library has been tested on 64-bit Intel and ARM architectures.

Dependencies
------------
This library does not rely on 3rd party dependencies at the moment.

Build Tools
-----------
This release includes a Xcode library project for a simplified build 
process. The minimal required version for Xcode is 12.1 (iOS 14.1 SDK).
The Xcode compiler used is Apple's own clang++ compiler.

Build Process
-------------
The build process should be relatively straightforward:

1. Open the Xcode project found in the "build" folder.
2. Select your architecture (Simulator, Intel or ARM Native)
3. Build the Project.