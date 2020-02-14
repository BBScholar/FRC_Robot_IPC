# https://docs.bazel.build/versions/master/be/workspace.html#new_http_archive
load('@bazel_tools//tools/build_defs/repo:git.bzl', 'git_repository', 'new_git_repository')
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name="com_github_google_flatbuffers",
    tag="v1.10.0",
    init_submodules=True,
    remote = "https://github.com/google/flatbuffers.git"
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
