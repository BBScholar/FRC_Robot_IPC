
_deploy_dir_attr = {
    "srcs" : attr.label_list(
        mandatory = True,
        allow_files = True
    ),
    "dir" : attr.string(
        mandatory= True
    )
}

def _deploy_dir_impl(ctx):
    return struct(
        downloader_dir = ctx.attr.dir,
        downloader_srcs = ctx.files.srcs
    )

deploy_dir = rule(
    attrs = _deploy_dir_attr,
    implementation = _deploy_dir_impl
)

_deploy_attr = {
    "_downloader": attr.label(
        executable = True,
        cfg = "host",
        default = Label("//tools:deploy")
    ),
    "start_srcs": attr.label_list(
        mandatory = True,
        allow_files = True,
    ),
    "srcs": attr.label_list(
        mandatory = True,
        allow_files = True
    ),
    "dirs" : attr.label_list(
        mandatory = False,
        providers = [
            "downloader_dir",
            "downloader_srcs"
        ]
    ),
    "deploy_location" : attr.string(
        default = "roborio-5419-frc.local"
    )
}

def _deploy_impl(ctx):
    pass

deploy = repository_rule(
    implementation=_robot_deploy_impl,
    executable=True,
    attrs=_robot_deploy_attr
)

def robot_deploy(start_binaries, binaries=[], dirs=None, default_target=[]):
    deploy(
        name="deploy",
        start_srcs=start_binaries,
        srcs=binaries,
        dirs=dirs,
        default_target= default_target,
    )