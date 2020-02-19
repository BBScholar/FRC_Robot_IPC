# FRC IPC Architecture Proof of Concept
![CI](https://github.com/BBScholar/FRC_Robot_IPC/workflows/CI/badge.svg?branch=master)

## Description:
IPC framework intended for use in First Robotics Competition using [ZeroMQ](https://zeromq.org/) (for now atleast). Built with [Bazel](https://bazel.build/), with cross-compiler integration and planned deploy script features.

## How to Build:
1. Clone the repository
2. Install [Bazel](https://bazel.build/)
3. If using Mac, follow [these](https://github.com/bazelbuild/sandboxfs/blob/master/INSTALL.md) instructions to install Sandboxfs
4. run `bazel build //... --config=roborio` to build the project
5. ???
6. Profit


## Planned Features:
- Full cross-compiler support (only roborio for now)
- Automated deploy script using Bazel + Python
- Full IPC communication with both C++ and Python APIs (More languages later?) 
- Fully unit-testable structure
- Robust logging system
- More?