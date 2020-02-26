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

load("//:bazel/wpilib_deps.bzl", "wpilib_deps")

wpilib_deps(
    ctre_version = CTRE_LIB_VERSION,
    ni_version = NI_LIB_VERSION,
    opencv_version = OPEN_CV_VERSION,
    wpilib_version = WPILIB_VERSION,
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

http_archive(
    name = "bazel_skylib",
    sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
    urls = ["https://github.com/bazelbuild/bazel-skylib/releases/download/0.8.0/bazel-skylib.0.8.0.tar.gz"],
)

http_archive(
    name = "com_github_tencent_rapidjson",
    sha256 = "8e00c38829d6785a2dfb951bb87c6974fa07dfe488aa5b25deec4b8bc0f6a3ab",
    strip_prefix = "rapidjson-1.1.0",
    url = "https://github.com/Tencent/rapidjson/archive/v1.1.0.zip",
    build_file = "@//third_party/rapidjson:rapidjson.BUILD",
)