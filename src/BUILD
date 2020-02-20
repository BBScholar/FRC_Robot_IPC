# https://docs.bazel.build/versions/master/be/c-cpp.html#cc_binary
cc_binary(
    name = "main",
    srcs = [
        "main.cpp",
        "main.h",
    ],
    copts = [],
    deps = [
        "@ctre_phoenix_api_cpp",
        "@eigen",
        "@wpilibc",
    ],
)
