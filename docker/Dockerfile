# install shader compiler
FROM ubuntu:22.04 as downloader
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
    wget \
    tar \
    ca-certificates \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget -r https://storage.googleapis.com/shaderc/badges/build_link_linux_clang_release.html && \
    find storage.googleapis.com -name install.tgz | xargs tar zfx && \
    mv install/bin/glslc / && \
    rm -r storage.googleapis.com install


FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install vulkan utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
    mesa-utils \
    vulkan-tools \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install vulkan development tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
    libvulkan-dev \
    vulkan-validationlayers \
    vulkan-validationlayers-dev \
    libglfw3-dev \
    libglm-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# install c++ compiler
# install vulkan utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    clang \
    make \
    libxxf86vm-dev \
    libxi-dev \
    libxrandr-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY --from=downloader /glslc /usr/local/bin/
