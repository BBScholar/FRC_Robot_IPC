load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "update_attrs",
    "workspace_and_buildfile",
)


_wpilib_artifact_attrs = {
    "version": attr.string(mandatory=True),
    "base_url": attr.string(mandatory=True),
    "config_settings": attr.string_list_dict(),
    "deps": attr.string_list(),

    "has_hdrs": attr.bool(default=True),
    "hdrs_sha256": attr.string(),

    "has_shared": attr.bool(default=True),
#    "shared_sha256": attr.string(),

    "has_static": attr.bool(default=True),
#    "static_sha256": attr.string(),

#    "has_debug": attr.bool(default=True),
#    "debug_sha256": attr.string(),
}

HEADER_BUILD_FILE_CONTENT = """
cc_library(
    name = "hdrs",
    hdrs = glob([
        "hdrs/**/*.h",
        "hdrs/**/*.inc",
        "hdrs/**/*.inl",
    ]),
    includes = ["."],
)
"""

def _wpilib_artifact_impl(ctx):
    updated_attrs = {}

    output_build_file_content = ""

    if ctx.attr.has_hdrs:
        hdrs_url = "{base_url}/{name}/{version}/{name}-{version}-headers.zip".format(
            base_url=ctx.attr.base_url,
            name=ctx.attr.name,
            version=ctx.attr.version,
        )
        updated_attrs["hdrs_sha256"] = ctx.download_and_extract(
            hdrs_url,
            "hdrs",
        ).sha256
        output_build_file_content += HEADER_BUILD_FILE_CONTENT

    for config_setting_name, config_setting_constraint_values in ctx.attr.config_settings.items():
        output_build_file_content += """
config_setting(
    name = "{config_setting_name}",
    constraint_values = [{config_setting_constraint_values}],
)
""".format(
    config_setting_name=config_setting_name,
    config_setting_constraint_values=", ".join([
        "\"{}\"".format(config_setting_constraint_value)
        for config_setting_constraint_value
        in config_setting_constraint_values
    ]),
)

        if ctx.attr.has_shared:
            shared_url = "{base_url}/{name}/{version}/{name}-{version}-{config_setting_name}.zip".format(
                base_url=ctx.attr.base_url,
                name=ctx.attr.name,
                version=ctx.attr.version,
                config_setting_name=config_setting_name,
            )
            ctx.download_and_extract(
                shared_url,
                "{config_setting_name}_shared".format(config_setting_name=config_setting_name),
            )
            output_build_file_content += """
cc_library(
    name = "{config_setting_name}_shared",
    srcs = glob([
        "{config_setting_name}_shared/**/*.so",
        "{config_setting_name}_shared/**/*.so.*",
    ]),
)
""".format(config_setting_name=config_setting_name)

        if ctx.attr.has_static:
            static_url = "{base_url}/{name}/{version}/{name}-{version}-{config_setting_name}.zip".format(
                base_url=ctx.attr.base_url,
                name=ctx.attr.name,
                version=ctx.attr.version,
                config_setting_name=config_setting_name,
            )
            ctx.download_and_extract(
                static_url,
                "{config_setting_name}_static".format(config_setting_name=config_setting_name),
            )
            output_build_file_content += """
cc_library(
    name = "{config_setting_name}_static",
    srcs = glob([
        "{config_setting_name}_static/**/*.a",
    ]),
)
""".format(config_setting_name=config_setting_name)



    ctx.file("BUILD", output_build_file_content)
    return update_attrs(ctx.attr, _wpilib_artifact_attrs.keys(), updated_attrs)

wpilib_artifact = repository_rule(
    implementation = _wpilib_artifact_impl,
    attrs = _wpilib_artifact_attrs,
)
