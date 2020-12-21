load("//tf:tf_configure.bzl", "tf_configure")
load("//gpu:cuda_configure.bzl", "cuda_configure")

tf_configure(name = "local_config_tf")

cuda_configure(name = "local_config_cuda")


load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Eigen
http_archive(
    name = "eigen",
    build_file = "//:eigen.BUILD",
    strip_prefix = "eigen-3.3.7",
    sha256 = "d56fbad95abf993f8af608484729e3d87ef611dd85b3380a8bad1d5cbc373a57",
    urls = [
        "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip",
        "http://vertexwahn.de/artifacts/eigen-3.3.7.tar.gz",
    ],
)
