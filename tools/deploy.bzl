

_robot_deploy_attr = {

}

def _robot_deploy_impl(ctx):
    pass

robot_deploy = repository_rule(
    implementation=_robot_deploy_impl,
    attrs=_robot_deploy_attr
)