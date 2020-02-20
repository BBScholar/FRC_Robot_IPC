cc_library(
    name = "ni_libraries_runtime_nirio_emb_can",
    srcs = [
        "linux/athena/shared/libnirio_emb_can.so.16.0.0",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":ni_libraries_runtime_ni_emb",
    ],
)

cc_library(
    name = "ni_libraries_runtime_ni_emb",
    srcs = [
        "linux/athena/shared/libni_emb.so.12.0.0",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":ni_libraries_runtime_ni_rtlog",
    ],
)

cc_library(
    name = "ni_libraries_runtime_ni_rtlog",
    srcs = [
        "linux/athena/shared/libni_rtlog.so.2.8.0",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "ni_libraries_runtime_NiFpgaLv",
    srcs = [
        "linux/athena/shared/libNiFpgaLv.so.19.0.0",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":ni_libraries_runtime_NiFpga",
        "@hal",
    ],
)

cc_library(
    name = "ni_libraries_runtime_NiFpga",
    srcs = [
        "linux/athena/shared/libNiFpga.so.19.0.0",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":ni_libraries_runtime_NiRioSrv",
        ":ni_libraries_runtime_niriodevenum",
        ":ni_libraries_runtime_niriosession",
    ],
)

cc_library(
    name = "ni_libraries_runtime_niriodevenum",
    srcs = [
        "linux/athena/shared/libniriodevenum.so.19.0.0",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "ni_libraries_runtime_niriosession",
    srcs = [
        "linux/athena/shared/libniriosession.so.18.0.0",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "ni_libraries_runtime_NiRioSrv",
    srcs = [
        "linux/athena/shared/libNiRioSrv.so.19.0.0",
    ],
    visibility = ["//visibility:public"],
)
