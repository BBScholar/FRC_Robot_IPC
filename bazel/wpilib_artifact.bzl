load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "update_attrs",
    "workspace_and_buildfile",
)


_wpilib_artifact_attrs = {
    "version": attr.string(mandatory=True),
    "base_url": attr.string(mandatory=True),
    "variants": attr.string_list_dict(),
    "deps": attr.string_list(),
    "linkopts" : attr.string_list(),

    "has_hdrs": attr.bool(default=True),
    "hdrs_sha256": attr.string(),

    "has_shared": attr.bool(default=True),
#    "shared_sha256": attr.string(),

    "has_static": attr.bool(default=True),
#    "static_sha256": attr.string(),

#    "has_debug": attr.bool(default=True),
#    "debug_sha256": attr.string(),
}

def _wpilib_artifact_impl(ctx):
    updated_attrs = {}

    output_workspace_file_content = ""
    output_build_file_content = ""

    output_workspace_file_content += "load(\"@bazel_tools//tools/build_defs/repo:http.bzl\", \"http_archive\") \n"
    
    # generate WORKSPACE
    # config settings
    for variant_name, variant_constraint_values in ctx.attr.variants.items():
        output_build_file_content += """
config_setting(
    name = "{variant_name}_config",
    constraint_values = [{variant_constraint_values}],
) \n
        """.format(
            variant_name=variant_name,
            variant_constraint_values = ", ".join([
                "\"{}\"".format(variant_constraint_value)
                for variant_constraint_value
                in variant_constraint_values
            ])
        )

    # generate headers rule
    if ctx.attr.has_hdrs:
        hdrs_url = "{base_url}/{name}/{version}/{name}-{version}-headers.zip".format(
            base_url=ctx.attr.base_url,
            name=ctx.attr.name,
            version=ctx.attr.version,
        )
        hdr = """
cc_library(
    name = "{}_hdrs",
    hdrs = glob([
        "**/*.h",
        "**/*.inc",
        "**/*.inl",
    ]),
    visibility=["//visibility:public"]
)
""".format(ctx.attr.name)


        output_workspace_file_content += """
http_archive(
    name="{name}_hdrs",
    urls = ["{url}"],
    build_file_content = \"\"\"{build_file_content}\"\"\"
) \n
        """.format(name=ctx.attr.name, url=hdrs_url, build_file_content=hdr)
        
    # generate http archives for shared and static libraries
    for variant_name, variant_constraint_values in ctx.attr.variants.items():
        if ctx.attr.has_shared:
            shared_url = "{base_url}/{name}/{version}/{name}-{version}-{variant_name}.zip".format(
                base_url=ctx.attr.base_url,
                name=ctx.attr.name,
                version=ctx.attr.version,
                variant_name=variant_name,
            )

            build_file = """
cc_library(
    name = "{name}_{variant_name}_shared",
    srcs = glob(
        [
            "**/*.so",
            "**/*.so.*",
        ],
        exclude = ["**/*.debug"],
    ),
    visibility=["//visibility:public"]
)
""".format(name=ctx.attr.name,variant_name=variant_name)

            output_workspace_file_content = """
http_archive(
    name = "{name}_{variant_name}_shared",
    urls = ["{url}"],
    build_file_content = \"\"\"{build_file_content}\"\"\"
)
""".format(
    name=ctx.attr.name,
    variant_name = variant_name,
    url = shared_url,
    build_file_content = build_file
)
            
        if ctx.attr.has_static:
            static_url = "{base_url}/{name}/{version}/{name}-{version}-{variant_name}static.zip".format(
                base_url=ctx.attr.base_url,
                name=ctx.attr.name,
                version=ctx.attr.version,
                variant_name=variant_name,
            )

            build_file = """
cc_library(
    name = "{name}_{variant_name}_static",
    srcs = glob([
        "**/*.a",
    ]),
    visibility=["//visibility:public"]
)
""".format(name=ctx.attr.name, variant_name=variant_name)

            output_workspace_file_content += """
http_archive(
    name="{name}_{variant_name}_static",
    urls = ["{url}"],
    build_file_content = \"\"\"{build_file_content} \"\"\"
)
            """.format(name=ctx.attr.name, variant_name=variant_name, url=static_url, build_file_content=build_file)

    deps = "[]"

    if ctx.attr.has_hdrs:
        deps += "+ [\"//external:{name}_hdrs\"]".format(name=ctx.attr.name)

    if ctx.attr.has_shared:
        deps += " + select({{{}, \"//conditions:default\": []}})".format(", ".join([
            "\":{variant_name}_config\": [\"//external:{name}_{variant_name}_shared\"]".format(name=ctx.attr.name,variant_name=variant_name)
            for variant_name
            in ctx.attr.variants.keys()
        ]))

    if ctx.attr.has_static:
        deps += " + select({{{}, \"//conditions:default\": []}})".format(", ".join([
            "\":{variant_name}_config\": [\"//external:{name}_{variant_name}_static\"]".format(name=ctx.attr.name, variant_name=variant_name)
            for variant_name
            in ctx.attr.variants.keys()
        ]))

    deps += "+ [{}]".format(", ".join([
        "\"{dep}\"".format(dep=dep)
        for dep in ctx.attr.deps
    ]))

    output_build_file_content += """
cc_library(
    name = "{name}",
    deps = {deps},
    linkopts = {linkopts},
    visibility = ["//visibility:public"],
)
""".format(
    name=ctx.attr.name,
    deps=deps,
    linkopts=ctx.attr.linkopts
)
    # print(output_workspace_file_content)
    # print(output_build_file_content)
    ctx.file("BUILD", output_build_file_content)
    ctx.file("WORKSPACE", output_workspace_file_content)
    return update_attrs(ctx.attr, _wpilib_artifact_attrs.keys(), {}) #updated_attrs)

wpilib_artifact = repository_rule(
    implementation = _wpilib_artifact_impl,
    attrs = _wpilib_artifact_attrs,
)
