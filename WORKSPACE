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
    urls = [
        "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip",
        "http://vertexwahn.de/artifacts/eigen-3.3.7.tar.gz",
    ],
)
