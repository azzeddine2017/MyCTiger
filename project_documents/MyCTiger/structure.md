# MyCTiger Project Structure

## Root Directory
- `tiger.ring`: The entry point script for the MyCTiger compiler/transpiler.
- `build.bat`: Script to compile `tiger.ring` into an executable (`tiger.exe`).
- `README.md`: Main project documentation.
- `LICENSE`: MIT License file.

## Source Code (`src/`)
- `main.ring`: Main loader file.
- `lib/`: Core library files.
    - `lib.ring`: Loader for the library components.
    - `globals.ring`: Global variable declarations (`Tiger` object, flags).
    - `functions.ring`: Core functions (`startTiger`, `testingTiger`).
    - `classes.ring`: Core classes (`Tiger`, `C`) that handle the DSL and code generation.

## Tools (`tools/`)
Contains the C compilers used by MyCTiger.
- `tcc/`: Tiny C Compiler (default backend).
- `msvc/`: Scripts to locate and use MSVC (if available).

## Tests (`tests/`)
- `hello.tiger`: Basic "Hello World" test case.

## Project Documents (`project_documents/`)
- `MyCTiger/`: Documentation specific to the MyCTiger project.
    - `README.md`: Product Roadmap and Task List.
    - `structure.md`: This file.
