FROM amazonlinux:2

# Path settings
ENV \
  RUSTUP_HOME="/usr/local/rustup" \
  CARGO_HOME="/usr/local/cargo" \
  PATH="/usr/local/cargo/bin:$PATH"

# Build dependencies
RUN yum update -y \
  && yum groupinstall -y "Development Tools" \
  && yum install -y --setopt=tsflags=nodocs \
    wget \
    tar \
    gperf \
    gtk-doc \
    jq \
    nasm \
    libtool \
    prelink \
    python3 \
    gcc-c++ \
    advancecomp \
    cmake3 \
    gobject-introspection-devel \
    swig \
  && pip3 install meson ninja \
  && ln -s /usr/bin/cmake3 /usr/bin/cmake \
  && ln -s /usr/bin/ninja-build /usr/bin/ninja \
  && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    --no-modify-path \
    --profile minimal

RUN yum install -y \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y libcxx brotli

# Compiler settings
ENV \
  PLATFORM="linux-x64" \
  FLAGS="-march=westmere" \
  MESON="--cross-file=/root/meson.ini"

COPY Toolchain.cmake /root/
COPY meson.ini /root/
