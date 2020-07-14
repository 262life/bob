FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN touch bob.bob \
    && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64 \
    && chmod +x ./kind \
    && sudo mv ./kind /usr/local/bin/kind \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get -y update \
    && sudo apt-get -y install apt-transport-https ca-certificates gnupg-agent software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && sudo apt-get -y update \
    && sudo apt-get -y install docker-ce docker-ce-cli containerd.io \
    && sudo chown root:root /usr/bin/dockerd && sudo chmod 7555 /usr/bin/dockerd

# Apply user-specific settings
