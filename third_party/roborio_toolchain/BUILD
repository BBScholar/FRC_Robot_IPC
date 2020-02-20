load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(
    name = "roborio_toolchain_config_darwin",
    path_prefix = "darwin/frc2020/roborio",
)

cc_toolchain_config(
    name = "roborio_toolchain_config_linux",
    path_prefix = "linux/frc2020/roborio",
)

cc_toolchain_config(
    name = "roborio_toolchain_config_windows",
    path_prefix = "windows/frc2020/roborio",
    path_suffix = ".exe",
)

filegroup(
    name = "roborio_toolchain_files_darwin",
    srcs = glob(["darwin/**/*"]),
)

filegroup(
    name = "roborio_toolchain_files_linux",
    srcs = glob(["linux/**/*"]),
)

filegroup(
    name = "roborio_toolchain_files_windows",
    srcs = glob(["windows/**/*"]),
)

cc_toolchain(
    name = "roborio_cc_toolchain_darwin",
    all_files = ":roborio_toolchain_files_darwin",
    ar_files = ":roborio_toolchain_files_darwin",
    as_files = ":roborio_toolchain_files_darwin",
    compiler_files = ":roborio_toolchain_files_darwin",
    dwp_files = ":roborio_toolchain_files_darwin",
    linker_files = ":roborio_toolchain_files_darwin",
    objcopy_files = ":roborio_toolchain_files_darwin",
    strip_files = ":roborio_toolchain_files_darwin",
    supports_param_files = False,
    toolchain_config = ":roborio_toolchain_config_darwin",
    toolchain_identifier = "roborio-toolchain",
)

cc_toolchain(
    name = "roborio_cc_toolchain_linux",
    all_files = ":roborio_toolchain_files_linux",
    ar_files = ":roborio_toolchain_files_linux",
    as_files = ":roborio_toolchain_files_linux",
    compiler_files = ":roborio_toolchain_files_linux",
    dwp_files = ":roborio_toolchain_files_linux",
    linker_files = ":roborio_toolchain_files_linux",
    objcopy_files = ":roborio_toolchain_files_linux",
    strip_files = ":roborio_toolchain_files_linux",
    supports_param_files = False,
    toolchain_config = ":roborio_toolchain_config_linux",
    toolchain_identifier = "roborio-toolchain",
)

cc_toolchain(
    name = "roborio_cc_toolchain_windows",
    all_files = ":roborio_toolchain_files_windows",
    ar_files = ":roborio_toolchain_files_windows",
    as_files = ":roborio_toolchain_files_windows",
    compiler_files = ":roborio_toolchain_files_windows",
    dwp_files = ":roborio_toolchain_files_windows",
    linker_files = ":roborio_toolchain_files_windows",
    objcopy_files = ":roborio_toolchain_files_windows",
    strip_files = ":roborio_toolchain_files_windows",
    supports_param_files = False,
    toolchain_config = ":roborio_toolchain_config_windows",
    toolchain_identifier = "roborio-toolchain",
)

toolchain(
    name = "roborio_toolchain_darwin",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:macos",
    ],
    target_compatible_with = [
        "@platforms//cpu:armv7",
        "@platforms//os:linux",
    ],
    toolchain = ":roborio_cc_toolchain_darwin",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

toolchain(
    name = "roborio_toolchain_linux",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:armv7",
        "@platforms//os:linux",
    ],
    toolchain = ":roborio_cc_toolchain_linux",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

toolchain(
    name = "roborio_toolchain_windows",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
    target_compatible_with = [
        "@platforms//cpu:armv7",
        "@platforms//os:linux",
    ],
    toolchain = ":roborio_cc_toolchain_windows",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
