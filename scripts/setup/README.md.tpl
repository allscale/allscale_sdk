# %PROJECT%

Description goes here...

## Installation

### Prerequisites

Ensure you have GCC 5 installed and set as your default C/C++ compiler.
Furthermore CMake 3.5 (or later) is required for the build and testing process.

### Configuration

Following options can be supplied to CMake

| Option              | Values          |
| ------------------- | --------------- |
| -DCMAKE_BUILD_TYPE  | Release / Debug |
| -DBUILD_SHARED_LIBS | ON / OFF        |
| -DBUILD_TESTS       | ON / OFF        |
| -DBUILD_DOCS        | ON / OFF        |
| -DUSE_ASSERT        | ON / OFF        |
| -DUSE_VALGRIND      | ON / OFF        |
| -DUSE_ALLSCALECC    | ON / OFF        |
| -DTHIRD_PARTY_DIR   | \<path\>        |

The file `cmake/build_settings.cmake` states their default value.

### Building / Testing

    $ mkdir build
    $ cd build
    $ cmake ../code
    $ make -j8
    $ ctest -j8

## Using the AllScale Compiler

To use the AllScale compiler, you first have to setup the required dependencies
in order to build it. A dependency installer is provided, running the following
commands should be sufficient on most systems. See
`scripts/dependencies/README.md` for more details.

    $ scripts/dependencies/installer
    $ scripts/dependencies/third_party_linker

To build this project using the AllScale compiler, simply set the corresponding
CMake option. You may want to use a separate build directory to easily switch
between GCC and AllScaleCC.

    $ mkdir build_with_allscalecc
    $ cd build_with_allscalecc
    $ cmake -DUSE_ALLSCALECC=ON ..
    $ make -j8
    $ ctest -j8

## Development

### Executable Bit

When working on Windows via SMB share, consider setting following Git setting.

    $ git config core.filemode false

### Licensor

A script, together with a Git hook, is provided to automatically add a license
header to each source file upon commit. See `scripts/license`.

### Eclipse Project

    $ cmake -G "Eclipse CDT4 - Unix Makefiles" /path/to/project

### Visual Studio Solution

    $ cmake -G "Visual Studio 14 Win64" -DBUILD_SHARED_LIBS=OFF Z:\path\to\project

Add path for third-party libraries when needed.

## Troubleshooting

### Getting GCC 5 / CMake 3.5 / Valgrind (for Testing)

The dependency installer can setup these required tools for you. Its README
(`scripts/dependencies/README.md`) holds the details.

It is preferred to use the operating system's package manager, if applicable.

### No Source Folder in Eclipse Project

Make sure your build folder is located outside the source folder. Eclipse is
not capable of dealing with such a setup correctly.
