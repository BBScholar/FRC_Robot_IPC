load("//:bazel/wpilib_artifact.bzl", "wpilib_artifact", "generate_wpilib_archives")

def wpilib_deps(wpilib_version, ctre_version, ni_version, opencv_version):
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


    generate_wpilib_archives(
        name = "wpilibc-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc",
        variants = common_variants,
        deps = [
            "@cameraserver-cpp//:cameraserver-cpp",
            "@hal-cpp//:hal-cpp",
            "@netcomm//:netcomm",
            "@ntcore-cpp//:ntcore-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "hal-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal",
        variants = common_variants,
        deps = [
            "@visa//:visa",
            "@wpiutil-cpp//:wpiutil-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "wpiutil-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil",
        variants = common_variants,
    )

    generate_wpilib_archives(
        name = "ntcore-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore",
        variants = common_variants,
        deps = [
            "@wpiutil-cpp//:wpiutil-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "cameraserver-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cameraserver",
        variants = common_variants,
        deps = [
            "@cscore-cpp//:cscore-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "cscore-cpp",
        version = wpilib_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore",
        variants = common_variants,
        deps = [
            "@opencv-cpp//:opencv-cpp",
            "@wpiutil-cpp//:wpiutil-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "api-cpp",
        version = ctre_version,
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
        linkopts = ["-pthread"],
        deps = [
            "@cci//:cci",
            "@wpiapi-cpp//:wpiapi-cpp",
        ],
    )

    generate_wpilib_archives(
        name = "core",
        version = ctre_version,
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

    generate_wpilib_archives(
        name = "cci",
        version = ctre_version,
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

    generate_wpilib_archives(
        name = "wpiapi-cpp",
        version = ctre_version,
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

    generate_wpilib_archives(
        name = "netcomm",
        version = ni_version,
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

    generate_wpilib_archives(
        name = "chipobject",
        version = ni_version,
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

    generate_wpilib_archives(
        name = "runtime",
        version = ni_version,
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

    generate_wpilib_archives(
        name = "visa",
        version = ni_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        variants = {
            "linuxathena": [
                "@platforms//cpu:armv7",
                "@platforms//os:linux",
            ],
        },
        has_static=False,
    )

    generate_wpilib_archives(
        name = "opencv-cpp",
        version = opencv_version,
        base_url = "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2020/opencv",
        variants = common_variants,
    )