load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "update_attrs",
    "workspace_and_buildfile",
)
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def generate_wpilib_archives(name, version, base_url, variants, has_hdrs=True, has_shared=True, has_static=True, deps=[], linkopts=[]):
    hdrs_url="{base_url}/{name}/{version}/{name}-{version}-headers.zip".format(
        base_url=base_url,
        name=name,
        version=version,
    )
    
    if(has_hdrs):
        build_file = """
cc_library(
    name = "{name}_hdrs",
    hdrs = glob([
        "**/*.h",
        "**/*.inc",
        "**/*.inl",
    ]),
    includes = ["."],
    visibility = ["//visibility:public"]
)
        """.format(name=name)

        http_archive(
            name="{name}_hdrs".format(name=name),
            urls=["{url}".format(url=hdrs_url)],
            build_file_content="""{}""".format(build_file)        )
    for variant_name, variant_constraint_values in variants.items():
        if(has_shared):
            shared_url = "{base_url}/{name}/{version}/{name}-{version}-{variant_name}.zip".format(
                base_url=base_url,
                name=name,
                version=version,
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
            """.format(name=name, variant_name=variant_name)

            http_archive(
                name="{name}_{variant_name}_shared".format(name=name, variant_name=variant_name),
                urls = ["{url}".format(url=shared_url)],
                build_file_content="""{}""".format(build_file)
            )

            print("creating repoitory of name: {name}_{variant_name}_shared".format(name=name, variant_name=variant_name))

        if(has_static):
            static_url = "{base_url}/{name}/{version}/{name}-{version}-{variant_name}static.zip".format(
                base_url=base_url,
                name=name,
                version=version,
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
            """.format(name=name, variant_name=variant_name)

            http_archive(
                name="{name}_{variant_name}_static".format(name=name, variant_name=variant_name),
                urls = ["{url}".format(url=static_url)],
                build_file_content="""{}""".format(build_file)
            )
    
    wpilib_artifact(
        name=name,
        deps=deps,
        linkopts=linkopts,
        variants=variants,
        has_hdrs=has_hdrs,
        has_shared=has_shared,
        has_static=has_static
    )

_wpilib_artifact_attrs = {
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

    output_build_file_content = ""

    
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
  
    deps = "[]"

    if ctx.attr.has_hdrs:
        deps += "+ [\"@{name}_hdrs\"]".format(name=ctx.attr.name)

    if ctx.attr.has_shared:
        deps += " + select({{{}, \"//conditions:default\": []}})".format(", ".join([
            "\":{variant_name}_config\": [\"@{name}_{variant_name}_shared\"]".format(name=ctx.attr.name,variant_name=variant_name)
            for variant_name
            in ctx.attr.variants.keys()
        ]))

    if ctx.attr.has_static:
        deps += " + select({{{}, \"//conditions:default\": []}})".format(", ".join([
            "\":{variant_name}_config\": [\"@{name}_{variant_name}_static\"]".format(name=ctx.attr.name, variant_name=variant_name)
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

    ctx.file("BUILD", output_build_file_content)
    return update_attrs(ctx.attr, _wpilib_artifact_attrs.keys(), {}) #updated_attrs)

wpilib_artifact = repository_rule(
    implementation = _wpilib_artifact_impl,
    attrs = _wpilib_artifact_attrs,
)
