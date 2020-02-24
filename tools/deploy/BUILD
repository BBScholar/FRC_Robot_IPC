filegroup(
    name = "rio_robot_command",
    srcs = ["robotCommand"],
)

sh_binary(
    name = "setup_roborio",
    srcs = ["setup_roborio.sh"],
    data = [
        ":rio_robot_command",
        # '@arm_frc_linux_gnueabi_repo//:compiler_pieces',
    ],
    visibility = ["//visibility:public"],
)
