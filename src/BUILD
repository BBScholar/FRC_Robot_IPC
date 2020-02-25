load("//tools/deploy:deploy.bzl", "robot_deploy")

cc_binary(
    name = "main",
    srcs = [
        "main.cpp",
        "main.h",
    ],
    copts = ["-std=c++17"],
    deps = [
        "@api-cpp",  # ctre
        "@eigen",
        "@wpilibc-cpp",
    ],
)


# waiting for https://github.com/bazelbuild/bazel/issues/3780 to be resolved
robot_deploy(
    name = "main_deploy",
    start_srcs=[":main"],
    srcs = [],
    deploy_location="roborio-5419-frc.local",
    # restricted_to=["//platforms:roborio"]
)
