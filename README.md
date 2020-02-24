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

## How to Deploy:
If your RoboRIO is not configured for our architecture, run `bazel run //tools/deploy:setup_roborio -- roborio-5419-frc.local` or whatever the host name/ip of the robot is. This will configure the rio to run our start script and not the default start script. In the future it will possibly configure other settings such as directories and symlinks.

Build the directory with a `robot_deploy` rule inside in order to deploy (ex: `bazel build //src:robot --config=roborio`)

## Planned Features:
- Full cross-compiler support (only roborio for now)
- Automated deploy script using Bazel + Python
- Full IPC communication with both C++ and Python APIs (More languages later?) 
- Fully unit-testable structure
- Robust logging system
- More?

## Styling:
For the C/C++ files, please use the google style-guide, the CI won't pass without it. Format the code with clang-format by executing `./format.sh src/`. Eventually, clang-tidy will be added as well. Make sure you have clang-tidy and clang-format installed.
