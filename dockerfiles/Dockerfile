FROM alpine:3.11

RUN set -ex \
    && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    aws-cli \
    acmetool \
    aws-cli-zsh-completion \
    apache2-utils \
    bash \
    bind-tools \
    bird \
    bridge-utils \
    busybox-extras \
    byobu \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file\
    fzf \
    fping \
    httpie \
    iftop \
    iperf \
    iproute2 \
    ipset \
    iptables \ 
    iptraf-ng \
    iputils \
    ipvsadm \
    jq \
    k9s \
    libc6-compat \
    liboping \
    mtr \
    mycli \
    net-snmp-tools \
    netcat-openbsd \
    nftables \
    ngrep \
    nmap \
    npm \
    nmap-nping \
    mitmproxy \
    openssl \
    py-crypto \
    py3-pip \
    pgcli \
    pdsh \
    pgbouncer \
    ripgrep \
    ranger \
    scapy \
    socat \
    strace \
    s3cmd \
    tinc \
    tmux \
    tcpdump \
    tcptraceroute \
    tshark \
    tig \
    util-linux \
    neovim \
    websocat \
    wireguard-tools \
    zsh \
	  build-base

# proxychains 
#RUN git clone https://github.com/haad/proxychains && cd proxychains && ./configure && make && sudo make install
#RUN pip install stormssh 
#RUN wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && unzip ngrok -d /usr/local/bin 

# Griml zsh config    
RUN wget -O .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# apparmor issue #14140
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump

# Installing ctop - top-like container monitor
RUN wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop && chmod +x /usr/local/bin/ctop

# Installing calicoctl
ARG CALICOCTL_VERSION=v3.13.3
RUN wget https://github.com/projectcalico/calicoctl/releases/download/${CALICOCTL_VERSION}/calicoctl && chmod +x calicoctl && mv calicoctl /usr/local/bin

# Installing istioctl
ARG ISTIO_VERSION=1.6.5
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh - && mv istio-${ISTIO_VERSION}/bin/* /usr/local/bin

# Installing helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Installing termshark
ENV TERMSHARK_VERSION 2.1.1
RUN wget https://github.com/gcla/termshark/releases/download/v${TERMSHARK_VERSION}/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz -O /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz && \
    tar -zxvf /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz && \
    mv termshark_${TERMSHARK_VERSION}_linux_x64/termshark /usr/local/bin/termshark && \
    chmod +x /usr/local/bin/termshark

#RUN git clone https://github.com/RhinoSecurityLabs/ccat.git && cd ccat && python3 setup.py install
RUN  git clone https://github.com/CISOfy/lynis && cd lynis && ./lynis audit system


# Settings

CMD ["/bin/zsh","-l"]
