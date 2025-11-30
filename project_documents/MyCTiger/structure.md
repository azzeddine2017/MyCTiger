# MyCTiger Project Structure

## Root Directory
- `tiger.ring`: The entry point script for the MyCTiger compiler/transpiler.
- `build.bat`: Script to compile `tiger.ring` into an executable (`tiger.exe`).
- `README.md`: Main project documentation with comprehensive usage guide.
- `LICENSE`: MIT License file.

## Source Code (`src/`)
- `main.ring`: Main loader file that loads the library.
- `lib/`: Core library files.
    - `lib.ring`: Loader for all library components (classes, functions, globals, std).
    - `globals.ring`: Global variable declarations and instances:
        - `Tiger` object (main DSL instance)
        - `stdio`, `stdlib`, `string` wrapper instances
        - Configuration flags: `lTigerFile`, `lTesting`, `cCompiler`, `lKeepFiles`, `lVerbose`
    - `functions.ring`: Core functions:
        - `startTiger()` - Main entry point with CLI argument parsing
        - `parseArguments()` - Command-line argument parser
        - `appInfo()`, `appVersion()`, `appHelp()` - User information functions
    - `classes.ring`: Core DSL classes:
        - `Tiger` class - Main DSL wrapper (extends C class)
        - `C` class - Core code generation engine with:
            - Global code management (`aGlobalCode`, `Global` block)
            - Main code management (`aMainCode`)
            - Header inclusion (`Header()` method)
            - Raw C code injection (`C` block)
            - Type-safe expression evaluation
    - `std/`: Standard library wrappers (Ring-like interfaces for C functions)
        - `stdio.ring`: TigerStdio class with `print()`, `println()`, `puts()` methods
        - `stdlib.ring`: TigerStdlib class with `exitProgram()`, `systemCall()` methods
        - `string.ring`: TigerString class with `strlen()`, `strcpy()`, `strcmp()` methods

## Tools (`tools/`)
Contains the C compilers used by MyCTiger.
- `tcc/`: Tiny C Compiler (default backend)
    - `tcc.exe` - Main TCC executable
    - `include/` - C standard library headers
    - `lib/` - C standard libraries
- `msvc/`: Scripts to locate and use MSVC (if available)
    - `locatevc.bat` - Script to set up MSVC environment

## Tests (`tests/`)
Test files for validation:
- `hello.tiger`: Basic "Hello World" test case
- `functions.tiger`: Custom function definition test
- `stdio_test.tiger`: Standard library wrapper test
- `stdlib_test.tiger`: System call wrapper test
- Additional test infrastructure files

## Examples (`examples/`)
Comprehensive example files demonstrating MyCTiger features:
- `01_hello_world.tiger`: Basic hello world program
- `02_variables.tiger`: Working with C variables in global scope
- `03_functions.tiger`: Defining and calling custom C functions
- `04_loops.tiger`: Using Ring loops for compile-time code generation
- `05_wrappers.tiger`: Using standard library wrappers
- `README.md`: Documentation for all examples with usage instructions

## Project Documents (`project_documents/`)
Documentation specific to the MyCTiger project:
- `MyCTiger/`: Project-specific documentation
    - `README.md`: Product Roadmap with all 5 completed modules
    - `structure.md`: This file - complete project structure documentation

## Key Features by Component

### Core DSL Engine (`src/lib/classes.ring`)
- Separation of global and main code
- Smart indentation handling for generated C code
- Type-safe expression evaluation (handles strings, numbers, lists, objects)
- Automatic header management
- Multiple compiler backend support (TCC, GCC, MSVC)

### CLI System (`src/lib/functions.ring`)
- Comprehensive argument parsing
- Support for flags: `--help`, `--version`, `--keep-files`, `--compiler`, `--verbose`
- Error handling and user feedback
- File existence validation

### Standard Library Wrappers (`src/lib/std/`)
- Ring-like syntax for common C operations
- Automatic header inclusion
- Type-safe method signatures
- Extensible architecture for adding more wrappers

## Generated Files (Runtime)

When running MyCTiger on a `.tiger` file, the following files are generated:
- `<filename>.c`: Generated C source code
- `<filename>.exe`: Compiled executable (Windows)
- `buildapp.bat`: Temporary build script (removed unless `--keep-files` is used)

## Configuration & Globals

Global configuration variables (defined in `src/lib/globals.ring`):
- `lTigerFile`: Boolean - indicates if processing a .tiger file
- `lTesting`: Boolean - testing mode flag
- `cCompiler`: String - selected compiler ("TCC", "GCC", or "MSVC")
- `lKeepFiles`: Boolean - keep intermediate files flag
- `lVerbose`: Boolean - verbose output flag

## Workflow

1. User runs: `ring tiger.ring <file.tiger> [options]`
2. `tiger.ring` loads `src/main.ring`
3. `src/main.ring` loads `src/lib/lib.ring`
4. `lib.ring` loads all components (globals, functions, classes, std)
5. `startTiger()` is called, which:
   - Parses command-line arguments
   - Validates file existence
   - Evaluates the .tiger file (Ring code execution)
6. During evaluation:
   - `Tiger {}` block is processed
   - Ring code generates C code via the DSL
   - Global and main code are separated
7. After evaluation:
   - C code is generated and written to `.c` file
   - Selected compiler builds the executable
   - Executable is run automatically
   - Cleanup is performed (unless `--keep-files`)

## Extension Points

The architecture supports easy extension:
- **New Wrappers**: Add new files to `src/lib/std/` and load in `lib.ring`
- **New Compilers**: Add build methods in `classes.ring` and update CLI parser
- **New DSL Commands**: Add methods to the `C` or `Tiger` classes
- **Custom Headers**: Use `Header()` method to include any C library
