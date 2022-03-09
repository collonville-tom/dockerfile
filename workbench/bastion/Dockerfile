# code copy from https://github.com/sspreitzer/shellinabox-container-image/blob/main/ubuntu/Dockerfile

FROM sspreitzer/shellinabox:ubuntu

RUN apt-get update \
    && apt-get install  -y --no-install-recommends bash curl \
                iproute2 jq mtr \
                net-tools openssl \
                procps tcpdump tcptraceroute wget \
    && apt-get install -y --no-install-recommends python3 python3-pip python3-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/ \
    && pip3 install --upgrade pip setuptools \
    && pip3 install numpy pandas scikit-learn scipy six 

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
