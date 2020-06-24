FROM ubuntu:focal-20200319

RUN echo 'debconf debconf/frontend select Noninteractive' |  debconf-set-selections && \
    apt-get --quiet --yes update  && \
    apt-get --quiet --yes install --no-install-recommends fio iperf3 openssh-client openssh-server rsync curl wget iputils-ping dnsutils vim-tiny apt-utils pciutils nfs-ganesha nfs-ganesha-vfs systemctl&& \
    apt-get --quiet --yes upgrade && \
    apt-get --quiet --yes clean all && \
    apt-get --quiet --yes autoremove && \
    wget --quiet --no-check-certificate https://storage.googleapis.com/kubernetes-release/release/$(curl -k -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl  && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod 775 /usr/local/bin/kubectl && \
    mkdir work && \
    cd work && \
    export RELEASE="3.3.8" && \
    wget --quiet --no-check-certificate https://github.com/etcd-io/etcd/releases/download/v${RELEASE}/etcd-v${RELEASE}-linux-amd64.tar.gz && \
    tar zxf etcd-v${RELEASE}-linux-amd64.tar.gz && \
    cd etcd-v${RELEASE}-linux-amd64 && \
    cp ./etcd* /usr/local/bin/. && \
    cd ../../ && \
    cd /etc/alternatives && mv ./* /usr/bin/. && \
    rm -rf work

ADD files/entrypoint.sh /files/entrypoint.sh
ADD files/.bashrc /root/.bashrc
ADD files/screenfetch /usr/bin/screenfetch
ADD files/ganesha.conf /etc/ganesha/ganesha.conf

ENTRYPOINT [ "/files/entrypoint.sh" ]
