load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

# TODO: This file does some ugly path joining.
# It should be refactored when https://github.com/bazelbuild/bazel/issues/8438 is resolved.

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = "{}/bin/arm-frc2020-linux-gnueabi-ar{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "cpp",
            path = "{}/bin/arm-frc2020-linux-gnueabi-cpp{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "gcc",
            path = "{}/bin/arm-frc2020-linux-gnueabi-gcc{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "gcov",
            path = "{}/bin/arm-frc2020-linux-gnueabi-gcov{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "ld",
            path = "{}/bin/arm-frc2020-linux-gnueabi-ld{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "nm",
            path = "{}/bin/arm-frc2020-linux-gnueabi-nm{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "objdump",
            path = "{}/bin/arm-frc2020-linux-gnueabi-objdump{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
        tool_path(
            name = "strip",
            path = "{}/bin/arm-frc2020-linux-gnueabi-strip{}".format(ctx.attr.path_prefix, ctx.attr.path_suffix),
        ),
    ]

    toolchain_include_directories_feature = feature(
        name = "toolchain-include-directories",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "-no-canonical-prefixes",
                            "-std=c++17",
                            "-Wno-psabi",
                        ],
                    ),
                ],
            ),
            flag_set(
                actions = [
                    ACTION_NAMES.cpp_link_executable,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "-lstdc++",
                        ],
                    ),
                ],
            ),
        ],
    )

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "roborio-toolchain",
        host_system_name = "unknown",  # TODO: should this be customizable?
        target_system_name = "arm-frc2020-linux-gnueabi",
        target_cpu = "armv7",
        target_libc = "gnueabi",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        builtin_sysroot = "third_party/roborio_toolchain/{}/arm-frc2020-linux-gnueabi".format(
            ctx.attr.path_prefix,
        ),
        features = [toolchain_include_directories_feature],
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "path_prefix": attr.string(default = "", mandatory = False),
        "path_suffix": attr.string(default = "", mandatory = False),
    },
    provides = [CcToolchainConfigInfo],
)
