cc_library(
    name = "ni_libraries_netcomm",
    srcs = [
        "linux/athena/shared/libFRC_NetworkCommunication.so.20.0.0",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@ni_libraries_chipobject",
        "@ni_libraries_netcomm_hdrs//:hdrs",
        "@ni_libraries_runtime//:ni_libraries_runtime_nirio_emb_can",
    ],
)
