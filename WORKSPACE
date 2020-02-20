workspace(name = "FRC_IPC")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

register_toolchains(
    "//third_party/roborio_toolchain:roborio_toolchain_darwin",
    "//third_party/roborio_toolchain:roborio_toolchain_linux",
    "//third_party/roborio_toolchain:roborio_toolchain_windows",
)

WPILIB_VERSION = "2020.2.2"

NI_LIB_VERSION = "2020.9.2"

CTRE_LIB_VERSION = "5.16.0"

OPEN_CV_VERSION = "3.4.7-2"

EIGEN_VERSION = "3.3.7"

git_repository(
    name = "com_github_google_flatbuffers",
    init_submodules = True,
    remote = "https://github.com/google/flatbuffers.git",
    tag = "v1.10.0",
)

git_repository(
    name = "gtest",
    init_submodules = True,
    remote = "https://github.com/google/googletest.git",
    tag = "release-1.8.1",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "af04c969321e8f428f63ceb73463d6ea817992698974abeff0161e069cd08bd6",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.21.3/rules_go-v0.21.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.21.3/rules_go-v0.21.3.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

new_git_repository(
    name = "eigen",
    build_file = "//third_party/eigen:eigen.BUILD",
    remote = "https://gitlab.com/libeigen/eigen.git",
    tag = "{}".format(EIGEN_VERSION),
)

new_git_repository(
    name = "libzmq",
    build_file = "//third_party/zeromq:libzmq.BUILD",
    remote = "https://github.com/zeromq/libzmq.git",
    tag = "v4.3.2",
)

new_git_repository(
    name = "cppzmq",
    build_file = "//third_party/zeromq:cppzmq.BUILD",
    remote = "https://github.com/zeromq/cppzmq.git",
    tag = "v4.6.0",
)

new_git_repository(
    name = "pyzmq",
    build_file = "//third_party/zeromq:pyzmq.BUILD",
    remote = "https://github.com/zeromq/pyzmq.git",
    tag = "v18.1.1",
)

hdrs_content = """
cc_library(
    name = "hdrs",
    hdrs = glob([
        "**/*.h",
        "**/*.inc",
        "**/*.inl",
    ]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

load("//:bazel/wpilib_artifact.bzl", "wpilib_artifact")

common_variants = {
    "linuxathena": [
        "@platforms//cpu:armv7",
        "@platforms//os:linux",
    ],
    "osxx86-64": [
        "@platforms//cpu:x86_64",
        "@platforms//os:osx",
    ],
    "linuxx86-64": [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    "windowsx86-64": [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
}

wpilib_artifact(
    name = "wpilibc-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc",
    variants = common_variants,
    deps = [
        "@cameraserver-cpp//:cameraserver-cpp",
        "@hal-cpp//:hal-cpp",
        "@netcomm//:netcomm",
        "@ntcore-cpp//:ntcore-cpp",
    ],
)

wpilib_artifact(
    name = "hal-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal",
    variants = common_variants,
    deps = [
        "@visa//:visa",
        "@wpiutil-cpp//:wpiutil-cpp",
    ],
)

wpilib_artifact(
    name = "wpiutil-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil",
    variants = common_variants,
)

wpilib_artifact(
    name = "ntcore-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore",
    variants = common_variants,
    deps = [
        "@wpiutil-cpp//:wpiutil-cpp",
    ],
)

wpilib_artifact(
    name = "cameraserver-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver",
    variants = common_variants,
    deps = [
        "@cscore-cpp//:cscore-cpp",
    ],
)

wpilib_artifact(
    name = "cscore-cpp",
    version = WPILIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore",
    variants = common_variants,
    deps = [
        "@opencv-cpp//:opencv-cpp",
        "@wpiutil-cpp//:wpiutil-cpp",
    ],
)

wpilib_artifact(
    name = "api-cpp",
    version = CTRE_LIB_VERSION,
    base_url = "https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
        "linuxx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:linux",
        ],
        "windowsx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:windows",
        ],
    },
    has_shared=False,
    deps = [
        "@cci//:cci",
        "@wpiapi-cpp//:wpiapi-cpp",
    ],
)

wpilib_artifact(
    name = "core",
    version = CTRE_LIB_VERSION,
    base_url = "https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
        "linuxx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:linux",
        ],
        "windowsx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:windows",
        ],
    },
    has_shared=False,
)

wpilib_artifact(
    name = "cci",
    version = CTRE_LIB_VERSION,
    base_url = "https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
        "linuxx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:linux",
        ],
        "windowsx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:windows",
        ],
    },
    has_shared=False,
    deps = [
        "@core//:core",
    ],
)

wpilib_artifact(
    name = "wpiapi-cpp",
    version = CTRE_LIB_VERSION,
    base_url = "https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
        "linuxx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:linux",
        ],
        "windowsx86-64": [
            "@platforms//cpu:x86_64",
            "@platforms//os:windows",
        ],
    },
    has_shared=False,
)

wpilib_artifact(
    name = "netcomm",
    version = NI_LIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
    },

    has_static=False,
    deps = [
        "@chipobject//:chipobject",
        "@runtime//:runtime",
    ],
)

wpilib_artifact(
    name = "chipobject",
    version = NI_LIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
    },
    has_static=False,
    deps = [
        "@runtime//:runtime",
    ],
)

wpilib_artifact(
    name = "runtime",
    version = NI_LIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
    },
    has_hdrs=False,
    has_static=False,
    deps = [
        "@hal-cpp//:hal-cpp",
    ],
)

wpilib_artifact(
    name = "visa",
    version = NI_LIB_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
    variants = {
        "linuxathena": [
            "@platforms//cpu:armv7",
            "@platforms//os:linux",
        ],
    },
    has_static=False,
)

wpilib_artifact(
    name = "opencv-cpp",
    version = OPEN_CV_VERSION,
    base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv",
    variants = common_variants,
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "be9296bfd64882e3c08e3283c58fcb461fa6dd3c171764fcc4cf322f60615a9b",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-master",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/master.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-master",
    url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
)
