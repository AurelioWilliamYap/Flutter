FROM gitpod/workspace-full

USER gitpod

# Install Flutter
RUN sudo apt-get update && \
    sudo apt-get install -y curl unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev && \
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 /home/gitpod/flutter && \
    /home/gitpod/flutter/bin/flutter doctor

ENV PATH="/home/gitpod/flutter/bin:/home/gitpod/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /workspace
