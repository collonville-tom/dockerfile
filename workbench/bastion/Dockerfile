FROM collonvillethomas.freeboxos.fr:5000/shell-in-the-box:0.1.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install  -y --no-install-recommends \
                gnupg-agent \
                curl \
                gnupg  \
                gnupg2 \
                libglib2.0-0 libnss3 libx11-6 \
                unzip \
                lsb-release \
                bash \
                nano vim\
                git \
                zip \
                jq \
                apt-transport-https \
                software-properties-common \
                iproute2 jq mtr iputils-ping \
                net-tools openssl \
                procps tcpdump tcptraceroute wget \
                ca-certificates \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/             

# Installation du client Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/ubuntu/gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/


#miror of https://dl.k8s.io/release/v1.34.0/bin/linux/amd64/kubectl
RUN wget --no-check-certificate https://collonvillethomas.freeboxos.fr/public/tools/kubectl/1.34.0/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

#miror of https://get.helm.sh/helm-v4.0.4-linux-amd64.tar.gz
RUN wget --no-check-certificate https://collonvillethomas.freeboxos.fr/public/tools/helm/4.0.4/helm-v4.0.4-linux-amd64.tar.gz \
    && tar -zxvf helm-v4.0.4-linux-amd64.tar.gz \
    && rm helm-v4.0.4-linux-amd64.tar.gz \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /usr/local/bin/helm \
    && rm -r ./linux-amd64

RUN mkdir -p /home/ansible-user/.ssh
RUN mkdir -p /home/ansible-user/workspace
