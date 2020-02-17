# https://docs.bazel.build/versions/master/be/workspace.html#new_http_archive
load('@bazel_tools//tools/build_defs/repo:git.bzl', 'git_repository', 'new_git_repository')
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

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

RULES_JVM_EXTERNAL_TAG = "3.0"
RULES_JVM_EXTERNAL_SHA = "62133c125bf4109dfd9d2af64830208356ce4ef8b165a6ef15bbff7460b35c3a"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "junit:junit:4.12",
        "androidx.test.espresso:espresso-core:3.1.1",
        "org.hamcrest:hamcrest-library:1.3",
    ],
    repositories = [
        # Private repositories are supported through HTTP Basic auth
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
    ],
)

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
    name = "allwpilib",
    remote = "https://github.com/wpilibsuite/allwpilib.git",
    tag = "v2020.2.2",
    build_file = "//third_party:allwpilib.BUILD"
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

# steal ni libs from 971
http_archive(
    name = "allwpilib_ni_libraries_2019",
    build_file = "@//third_party:ni-libraries-2019.BUILD",
    sha256 = "2cdcde3391f36877b7533e15d0f36baf696b27c1107b77192a8200e26f13278c",
    url = "http://www.frc971.org/Build-Dependencies/allwpilib_ni-libraries_4785480.tar.gz",
)