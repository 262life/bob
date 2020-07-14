FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN touch bob.bob \
    && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64 \
    && chmod +x ./kind \
    && sudo mv ./kind /usr/local/bin/kind \
    && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
