# Product Roadmap: MyCTiger

## 1. Vision
MyCTiger aims to transform the Ring programming language into a powerful meta-language for C. It allows developers to write C programs using Ring's expressive syntax, enabling compile-time code generation and seamless C library integration without bindings.

## 2. Technology Stack
- **Language**: Ring (for the DSL and meta-programming).
- **Target Language**: C (C99 standard).
- **Compiler**: TCC (Tiny C Compiler) as the default backend.
- **Platform**: Windows (Primary), Linux (Future).

## 3. Constraints & Principles
- **No Node.js**: Pure Ring and C ecosystem.
- **Foundation First**: All features must be planned before implementation.
- **Intuition-First**: The DSL syntax should feel natural to Ring developers while mapping logically to C.

## 4. Functional Modules

### Module 1: Foundation & Setup
- **Goal**: Establish the project structure and documentation.
- **Status**: **Complete**.
- **Tasks**:
    - [x] Create Roadmap (This file).
    - [x] **T01.01**: Verify `tiger.ring` entry point and its connection to `src/main.ring`.
    - [x] **T01.02**: Verify `tools` directory contents (TCC existence).
    - [x] **T01.03**: Create a basic test script (`tests/hello.tiger`) to validate the current implementation manually.
    - [x] **T01.04**: Document the directory structure in a new `project_documents/MyCTiger/structure.md`.

### Module 2: Core DSL Enhancements
- **Goal**: Improve the `Tiger` and `C` classes to support more complex C generation patterns.
- **Tasks**:
    - [ ] Support for defining C functions outside of `main`.
    - [ ] Support for including custom headers.
    - [ ] Improved indentation handling for generated code.

### Module 3: Standard Library Wrappers
- **Goal**: Provide Ring-like wrappers for common C standard library functions to reduce raw C injection needs.
- **Tasks**:
    - [ ] `stdio.h` wrappers (printf, scanf, file I/O).
    - [ ] `stdlib.h` wrappers (malloc, free, system).
    - [ ] `string.h` wrappers.

### Module 4: Tooling & CLI
- **Goal**: Enhance the command-line interface.
- **Tasks**:
    - [ ] Support for compiler selection (TCC, GCC, MSVC).
    - [ ] Command-line flags for keeping intermediate files.
    - [ ] "Watch" mode for auto-recompilation.

### Module 5: Testing & Examples
- **Goal**: Ensure reliability and provide learning resources.
- **Tasks**:
    - [ ] Create a test runner in Ring.
    - [ ] Add comprehensive examples for each feature.

---
*This roadmap is a living document and will be updated as the project evolves.*
