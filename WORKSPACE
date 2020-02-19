load('@bazel_tools//tools/build_defs/repo:git.bzl', 'git_repository', 'new_git_repository')
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

WPILIB_VERSION = "2020.2.2"
NI_LIB_VERSION = "2020.9.2"
CTRE_LIB_VERSION = "5.16.0"
OPEN_CV_VERSION = "3.4.7-2"

git_repository(
    name="com_github_google_flatbuffers",
    tag="v1.10.0",
    init_submodules=True,
    remote = "https://github.com/google/flatbuffers.git"
)

git_repository(
    name="gtest",
    tag="release-1.8.1",
    init_submodules=True,
    remote = "https://github.com/google/googletest.git"
)

http_archive(
    name = "io_bazel_rules_go",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.21.3/rules_go-v0.21.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.21.3/rules_go-v0.21.3.tar.gz",
    ],
    sha256 = "af04c969321e8f428f63ceb73463d6ea817992698974abeff0161e069cd08bd6",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()


new_git_repository(
    name = "zeromq",
    remote = "https://github.com/zeromq/libzmq.git",
    tag = "v4.3.2",
    build_file_content = """cc_library(
            name = "zeromq",
            includes = ['include/'],
            hdrs = glob(["include/*.h"]) + glob(["src/**/*.h"]) + glob(["src/**/*.hpp"]),
            srcs = glob(["src/**/*.cpp"]),
            visibility = ['//visibility:public']
        )
    """
)

new_git_repository(
    name = "cppzmq",
    remote = "https://github.com/zeromq/cppzmq.git",
    tag = "v4.6.0",
    build_file_content = """cc_library(
        name = "cppzmq",
        hdrs = ["zmq.hpp", "zmq_addon.hpp"],
        deps = ["@zeromq//:zeromq"]
        visibility = ['//visibility:public']
    )"""
)

new_git_repository(
    name="pyzmq",
    remote="https://github.com/zeromq/pyzmq.git",
    tag="v18.1.1",
    build_file_content = """py_library(
        name="pyzmq"
    )
    """
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
    name="wpilibc_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc/wpilibc-cpp/{0}/wpilibc-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="wpilibc",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc/wpilibc-cpp/{0}/wpilibc-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:wpilibc.BUILD",
)

http_archive(
    name="hal_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal/hal-cpp/{0}/hal-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="hal",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal/hal-cpp/{0}/hal-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:hal.BUILD",
)

http_archive(
    name="wpiutil_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil/wpiutil-cpp/{0}/wpiutil-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="wpiutil",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil/wpiutil-cpp/{0}/wpiutil-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:wpiutil.BUILD",
)

http_archive(
    name="ntcore_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore/ntcore-cpp/{0}/ntcore-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ntcore",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore/ntcore-cpp/{0}/ntcore-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:ntcore.BUILD",
)

http_archive(
    name="cameraserver_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver/cameraserver-cpp/{0}/cameraserver-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="cameraserver",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver/cameraserver-cpp/{0}/cameraserver-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:cameraserver.BUILD",
)

http_archive(
    name="cscore_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore/cscore-cpp/{0}/cscore-cpp-{0}-headers.zip".format(WPILIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="cscore",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore/cscore-cpp/{0}/cscore-cpp-{0}-linuxathenastatic.zip".format(WPILIB_VERSION)],
    build_file="//third_party/wpilibsuite:cscore.BUILD",
)

http_archive(
    name="ctre_phoenix_api_cpp_hdrs",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/api-cpp/{0}/api-cpp-{0}-headers.zip".format(CTRE_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ctre_phoenix_api_cpp",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/api-cpp/{0}/api-cpp-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
    build_file="//third_party/ctre/phoenix:api_cpp.BUILD",
)

http_archive(
    name="ctre_phoenix_core_hdrs",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/core/{0}/core-{0}-headers.zip".format(CTRE_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ctre_phoenix_core",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/core/{0}/core-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
    build_file="//third_party/ctre/phoenix:core.BUILD",
)

http_archive(
    name="ctre_phoenix_cci_hdrs",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/cci/{0}/cci-{0}-headers.zip".format(CTRE_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ctre_phoenix_cci",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/cci/{0}/cci-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
    build_file="//third_party/ctre/phoenix:cci.BUILD",
)

http_archive(
    name="ctre_phoenix_wpiapi_cpp_hdrs",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/wpiapi-cpp/{0}/wpiapi-cpp-{0}-headers.zip".format(CTRE_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ctre_phoenix_wpiapi_cpp",
    urls=["https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/wpiapi-cpp/{0}/wpiapi-cpp-{0}-linuxathenastatic.zip".format(CTRE_LIB_VERSION)],
    build_file="//third_party/ctre/phoenix:wpiapi_cpp.BUILD",
)

http_archive(
    name="ni_libraries_netcomm_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/netcomm/{0}/netcomm-{0}-headers.zip".format(NI_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ni_libraries_netcomm",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/netcomm/{0}/netcomm-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
    build_file="//third_party/ni_libraries:netcomm.BUILD",
)

http_archive(
    name="ni_libraries_chipobject_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/chipobject/{0}/chipobject-{0}-headers.zip".format(NI_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ni_libraries_chipobject",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/chipobject/{0}/chipobject-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
    build_file="//third_party/ni_libraries:chipobject.BUILD",
)

http_archive(
    name="ni_libraries_runtime",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/runtime/{0}/runtime-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
    build_file="//third_party/ni_libraries:runtime.BUILD",
)

http_archive(
    name="ni_libraries_visa_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/visa/{0}/visa-{0}-headers.zip".format(NI_LIB_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="ni_libraries_visa",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries/visa/{0}/visa-{0}-linuxathena.zip".format(NI_LIB_VERSION)],
    build_file="//third_party/ni_libraries:visa.BUILD",
)

http_archive(
    name="opencv_hdrs",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv/opencv-cpp/{0}/opencv-cpp-{0}-headers.zip".format(OPEN_CV_VERSION)],
    build_file_content=hdrs_content,
)

http_archive(
    name="opencv",
    urls=["https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv/opencv-cpp/{0}/opencv-cpp-{0}-linuxathenastatic.zip".format(OPEN_CV_VERSION)],
    build_file="//third_party/wpilibsuite:opencv.BUILD",
)
