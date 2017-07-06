# %PROJECT%

Description goes here...

## Quickstart

Ensure you have GCC 5 installed and set as your default C/C++ compiler.
Furthermore CMake 3.5 (or later) is required for the build and testing process.
Simply execute the following commands to build the project and run all tests.

    $ mkdir build
    $ cd build
    $ cmake ../code
    $ make -j8
    $ ctest -j8

## Advanced Options

### Configuration

Following options can be supplied to CMake

| Option              | Values          |
| ------------------- | --------------- |
| -DCMAKE_BUILD_TYPE  | Release / Debug |
| -DBUILD_SHARED_LIBS | ON / OFF        |
| -DBUILD_TESTS       | ON / OFF        |
| -DBUILD_DOCS        | ON / OFF        |
| -DBUILD_COVERAGE    | ON / OFF        |
| -DUSE_ASSERT        | ON / OFF        |
| -DUSE_VALGRIND      | ON / OFF        |
| -DUSE_ALLSCALECC    | ON / OFF        |
| -DENABLE_PROFILING  | ON / OFF        |
| -DTHIRD_PARTY_DIR   | \<path\>        |

The files `cmake/build_settings.cmake` and `code/CMakeLists.txt` state their
default value.

## Using the AllScale Compiler

To use the AllScale compiler, you first have to setup the required dependencies
in order to build it. A dependency installer is provided, running the following
commands should be sufficient on most systems. See
`scripts/dependencies/README.md` for more details.

    $ scripts/dependencies/installer

To build this project using the AllScale compiler, simply set the corresponding
CMake option. You may want to use a separate build directory to easily switch
between GCC and AllScaleCC.

    $ mkdir build_with_allscalecc
    $ cd build_with_allscalecc
    $ ../scripts/dependencies/third_party_linker
    $ cmake -DUSE_ALLSCALECC=ON ..
    $ make -j8
    $ ctest -j8

## Development

### Adding new Modules

The setup script can be run again to add new modules, just provide the same
project name.

    $ scripts/setup/run %PROJECT% frontend backend utils

### Adding new Parts to Modules

There is a utility script to add new *parts* to an existing module. The project
name and module name must be provided followed by a list of *parts* to
generate. Folders will be created along the way.

    $ scripts/setup/add_part %PROJECT% frontend sema extensions/malloc_extension

This will add the files `sema.h`, `sema.cpp` and `sema_test.cc` to the
*frontend* module. Furthermore new subfolders `extensions` will be created
containing `malloc_extension.h`, `malloc_extension.cpp` and
`malloc_extension_test.cc` in their respective subdirectories.

### Using a present AllScale Compiler / API project

The following two CMake options allow you to manually set the AllScale Compiler
and AllScale API to use. Note that `USE_ALLSCALECC` must *not* be enabled for
this to work.

| Option                  | Values                         |
| ----------------------- | ------------------------------ |
| -DOVERRIDE_ALLSCALECC   | *path to `allscalecc` binary*  |
| -DOVERRIDE_ALLSCALE_API | *path to AllScale API project* |

### Executable Bit

When working on Windows via SMB share, consider setting following Git setting.

    $ git config core.filemode false

### Licensor

A script, together with a Git hook, is provided to automatically add a license
header to each source file upon commit. See `scripts/license`.

### Eclipse Project

    $ cmake -G "Eclipse CDT4 - Unix Makefiles" /path/to/project

### Visual Studio Solution

    $ cmake -G "Visual Studio 15 2017 Win64" -DBUILD_SHARED_LIBS=OFF Z:\path\to\project

Add path for third-party libraries when needed.

## Troubleshooting

### Getting GCC 5 / CMake 3.5 / Valgrind (for Testing)

The dependency installer can setup these required tools for you. Its README
(`scripts/dependencies/README.md`) holds the details.

It is preferred to use the operating system's package manager, if applicable.

### No Source Folder in Eclipse Project

Make sure your build folder is located outside the source folder. Eclipse is
not capable of dealing with such a setup correctly.

### Coverage

Building the coverage us currently only supported on Linux, as Perl and Bash
are required. To build and view the coverage set the corresponding CMake flag
to `ON` and run:

    $ make
    $ make coverage
    $ xdg-open coverage/index.html
