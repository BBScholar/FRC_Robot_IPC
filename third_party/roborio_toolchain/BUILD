load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_suite(
    name="roborio_toolchain_suite",
    toolchains={
        "darwin": ":roborio_toolchain",
        "linux": ":roborio_toolchain",
        "windows": ":roborio_toolchain",
        "k8": ":roborio_toolchain"
    },
)

filegroup(
    name="roborio_toolchain_files",
    srcs=select({
        "@bazel_tools//src/conditions:darwin": glob(["darwin/**/*"]),
        "@bazel_tools//src/conditions:linux_x86_64": glob(["linux/**/*"]),
        "@bazel_tools//src/conditions:windows": glob(["windows/**/*"]),
    }),
)

cc_toolchain(
    name="roborio_toolchain",
    toolchain_identifier="roborio-toolchain",
    toolchain_config=":roborio_toolchain_config",
    all_files=":roborio_toolchain_files",
    ar_files=":roborio_toolchain_files",
    as_files=":roborio_toolchain_files",
    compiler_files=":roborio_toolchain_files",
    dwp_files=":roborio_toolchain_files",
    linker_files=":roborio_toolchain_files",
    objcopy_files=":roborio_toolchain_files",
    strip_files=":roborio_toolchain_files",
    supports_param_files=False,
)

cc_toolchain_config(
    name="roborio_toolchain_config",
    path_prefix=select({
        "@bazel_tools//src/conditions:darwin": "darwin/frc2020/roborio",
        "@bazel_tools//src/conditions:linux_x86_64": "linux/frc2020/roborio",
        "@bazel_tools//src/conditions:windows": "windows/frc2020/roborio",
    }),
    path_suffix=select({
        "@bazel_tools//src/conditions:windows": ".exe",
        "//conditions:default": "",
    }),
)
