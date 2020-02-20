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

http_archive(
    name = "wpilibc_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc/wpilibc-cpp/{0}/wpilibc-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "wpilibc",
    build_file = "//third_party/wpilibsuite:wpilibc.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc/wpilibc-cpp/{0}/wpilibc-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "hal_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal/hal-cpp/{0}/hal-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "hal",
    build_file = "//third_party/wpilibsuite:hal.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal/hal-cpp/{0}/hal-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "wpiutil_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil/wpiutil-cpp/{0}/wpiutil-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "wpiutil",
    build_file = "//third_party/wpilibsuite:wpiutil.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil/wpiutil-cpp/{0}/wpiutil-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "ntcore_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore/ntcore-cpp/{0}/ntcore-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "ntcore",
    build_file = "//third_party/wpilibsuite:ntcore.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore/ntcore-cpp/{0}/ntcore-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "cameraserver_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver/cameraserver-cpp/{0}/cameraserver-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "cameraserver",
    build_file = "//third_party/wpilibsuite:cameraserver.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver/cameraserver-cpp/{0}/cameraserver-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "cscore_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore/cscore-cpp/{0}/cscore-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "cscore",
    build_file = "//third_party/wpilibsuite:cscore.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore/cscore-cpp/{0}/cscore-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_api_cpp_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/api-cpp/{0}/api-cpp-{0}-headers.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_api_cpp",
    build_file = "//third_party/ctre/phoenix:api_cpp.BUILD",
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/api-cpp/{0}/api-cpp-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_core_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/core/{0}/core-{0}-headers.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_core",
    build_file = "//third_party/ctre/phoenix:core.BUILD",
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/core/{0}/core-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_cci_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/cci/{0}/cci-{0}-headers.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_cci",
    build_file = "//third_party/ctre/phoenix:cci.BUILD",
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/cci/{0}/cci-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_wpiapi_cpp_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/wpiapi-cpp/{0}/wpiapi-cpp-{0}-headers.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ctre_phoenix_wpiapi_cpp",
    build_file = "//third_party/ctre/phoenix:wpiapi_cpp.BUILD",
    urls = ["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/wpiapi-cpp/{0}/wpiapi-cpp-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_netcomm_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/netcomm/{0}/netcomm-{0}-headers.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_netcomm",
    build_file = "//third_party/ni_libraries:netcomm.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/netcomm/{0}/netcomm-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_chipobject_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/chipobject/{0}/chipobject-{0}-headers.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_chipobject",
    build_file = "//third_party/ni_libraries:chipobject.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/chipobject/{0}/chipobject-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_runtime",
    build_file = "//third_party/ni_libraries:runtime.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/runtime/{0}/runtime-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_visa_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/visa/{0}/visa-{0}-headers.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "ni_libraries_visa",
    build_file = "//third_party/ni_libraries:visa.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/visa/{0}/visa-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
)

http_archive(
    name = "opencv_hdrs",
    build_file_content = hdrs_content,
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv/opencv-cpp/{0}/opencv-cpp-{0}-headers.zip".format(OPEN_CV_VERSION)],
)

http_archive(
    name = "opencv",
    build_file = "//third_party/wpilibsuite:opencv.BUILD",
    urls = ["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv/opencv-cpp/{0}/opencv-cpp-{0}-linuxathenastatic.zip".format(OPEN_CV_VERSION)],
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
