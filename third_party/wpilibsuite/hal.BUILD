cc_library(
    name = "hal",
    srcs = [
        "linux/athena/static/libwpiHal.a",
    ],
    linkopts = ["-lm"],
    visibility = ["//visibility:public"],
    deps = [
        "@hal_hdrs//:hdrs",
        "@ni_libraries_visa",
        "@wpiutil",
    ],
)
