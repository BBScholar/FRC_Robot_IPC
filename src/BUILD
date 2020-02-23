# https://docs.bazel.build/versions/master/be/c-cpp.html#cc_binary
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
