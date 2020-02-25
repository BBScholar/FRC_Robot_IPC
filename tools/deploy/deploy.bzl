load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "update_attrs",
    "workspace_and_buildfile",
)

_deploy_dir_attr = {
    "srcs": attr.label_list(
        mandatory = True,
        allow_files = True,
    ),
    "dir": attr.string(
        mandatory = True,
    ),
}

def _deploy_dir_impl(ctx):
    return struct(
        downloader_dir = ctx.attr.dir,
        downloader_srcs = ctx.files.srcs,
    )

deploy_dir = repository_rule(
    attrs = _deploy_dir_attr,
    implementation = _deploy_dir_impl,
)

_robot_deploy_attr = {
    "_downloader": attr.label(
        executable = True,
        cfg = "host",
        default = Label("//tools/deploy:deployer"),
    ),
    "start_srcs": attr.label_list(
        mandatory = True,
        allow_files = True,
    ),
    "srcs": attr.label_list(
        mandatory = True,
        allow_files = True,
    ),
    "dirs": attr.label_list(
        mandatory = False,
        providers = [
            "downloader_dir",
            "downloader_srcs",
        ],
    ),
    "deploy_location": attr.string(
        default = "roborio-5419-frc.local",
    ),
}

def _robot_deploy_impl(ctx):
    all_files = ctx.files.srcs + ctx.files.start_srcs + [ctx.outputs._startlist]
    ctx.actions.write(
        output=ctx.outputs.executable,
        is_executable=True,
        # im not sure what the code actually does here, well figure it out
        content = '\n'.join([
        '#!/bin/bash',
        'set -e',
        'cd "${BASH_SOURCE[0]}.runfiles/%s"' % ctx.workspace_name,
        ] + ['%s %s --dirs %s -- %s "$@"' % (
        ctx.executable._downloader.short_path,
        ' '.join([src.short_path for src in d.downloader_srcs]),
        d.downloader_dir,
        ctx.attr.deploy_location) for d in ctx.attr.dirs] + [
        'exec %s %s -- %s "$@"' % (ctx.executable._downloader.short_path,
                                    ' '.join([src.short_path for src in all_files]),
                                    ctx.attr.deploy_location),
        ]),
    )

    ctx.actions.write(
        output = ctx.outputs._startlist,
        content = '\n'.join([f.basename for f in ctx.files.start_srcs]) + '\n',
    )
    to_download = [ctx.outputs._startlist]
    to_download += all_files
    for d in ctx.attr.dirs:
        to_download += d.downloader_srcs

    return struct(
        runfiles = ctx.runfiles(
            files = to_download + ctx.files._downloader,
            transitive_files = ctx.attr._downloader.default_runfiles.files,
            collect_data = True,
            collect_default = True,
        ),
        files = depset([ctx.outputs.executable]),
    )

robot_deploy = rule(
    implementation = _robot_deploy_impl,
    attrs = _robot_deploy_attr,
    outputs = {
        "_startlist": "%{name}.start_list.dir/start_list.txt",
    },
    executable = True
)
