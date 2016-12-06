# %PROJECT%

Description goes here...

## Installation

### Dependencies

Ensure you have GCC 5 installed and set as your default C/C++ compiler. Next
run the following commands. More details can be found in
`scripts/dependencies`.

    $ scripts/dependencies/installer
    $ scripts/dependencies/third_party_linker

### Configuration

Following options can be supplied to CMake

| Option              | Values          |
| ------------------- | --------------- |
| -DCMAKE_BUILD_TYPE  | Release / Debug |
| -DBUILD_SHARED_LIBS | ON / OFF        |
| -DBUILD_TESTS       | ON / OFF        |
| -DBUILD_DOCS        | ON / OFF        |
| -DUSE_ASSERT        | ON / OFF        |
| -DUSE_ALLSCALECC    | ON / OFF        |

### Building / Testing

    $ mkdir build
    $ cd build
    $ ../third_party/cmake-latest/bin/cmake ..
    $ make
    $ make test

## Development

### Executable Bit

When working on Windows via SMB share, consider setting following Git setting.

    $ git config core.filemode false

### Licensor

A script, together with a Git hook, is provided to automatically add a license
header to each source file upon commit. See `scripts/license`.

### Visual Studio Solution

    $ cmake -G "Visual Studio 14 Win64" -DBUILD_SHARED_LIBS=OFF Z:\path\to\project

Add path for third-party libraries when needed.
