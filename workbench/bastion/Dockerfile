FROM mahasiah:32188/shellinabox:1.0.0

ENV DEBIAN_FRONTEND noninteractive

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
                apt-transport-https \
                software-properties-common \
                iproute2 jq mtr iputils-ping \
                net-tools openssl \
                procps tcpdump tcptraceroute wget \
                ca-certificates \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/             

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update \
    && apt-get install  -y --no-install-recommends \
                docker-ce docker-ce-cli containerd.io \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.8.0-linux-amd64.tar.gz \
    && rm helm-v3.8.0-linux-amd64.tar.gz \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /usr/local/bin/helm \
    && rm -r ./linux-amd64

RUN mkdir -p /home/ansible-user/.ssh
RUN mkdir -p /home/ansible-user/workspace
