# FRC IPC Architecture Proof of Concept
![CI](https://github.com/BBScholar/FRC_Robot_IPC/workflows/CI/badge.svg?branch=master)

## Description:
IPC framework intended for use in First Robotics Competition using [ZeroMQ](https://zeromq.org/) (for now atleast). Built with [Bazel](https://bazel.build/), with cross-compiler integration and planned deploy script features.

## How to Build:
1. Clone the repository
2. Install [Bazel](https://bazel.build/)
3. Follow [these](https://github.com/bazelbuild/sandboxfs/blob/master/INSTALL.md) instructions to install Sandboxfs
4. run `bazel build //... --config=roborio` to build the project
5. ???
6. Profit

## How to Deploy:
Make sure you have python3, scp, ssh, and sync available from your command line, otherwise the deploy script will not work.

If your RoboRIO is not configured for our architecture, run `bazel run //tools/deploy:setup_roborio -- roborio-5419-frc.local` with whatever the host name/ip of your robot is. This will configure the rio to run our start script and not the default start script. In the future it will possibly configure other settings such as directories and symlinks.

Run the deploy rule as follows: `bazel run //src:main_deploy --config=roborio -c opt`. The script will ssh into the roborio, install needed packages (rysnc, ssl, python, etc) and then deploy the robot binaries.

## Planned Features:
- Full cross-compiler support (This is mostly working as of now)
- Automated deploy script using Bazel + Python (Written, but needs to be tested)
- Full IPC communication with both C++ and Python APIs (More languages later?) 
- Fully unit-testable structure
- Robust logging system
- More?

## Styling:
For the C/C++ files, please use the google style-guide, the CI won't pass without it. Format the code with clang-format by executing `./format.sh src/`. Eventually, clang-tidy will be added as well. Make sure you have clang-tidy and clang-format installed.
