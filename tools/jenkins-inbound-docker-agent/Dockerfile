# On part de l'agent officiel Debian (plus sûr que Alpine pour la compat)
FROM jenkins/inbound-agent:jdk21

USER root

# Installation du client Docker
RUN apt-get update && apt-get install -y lsb-release curl \
    && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg \
    && echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli

# Si tu as besoin d'outils très communs (git, zip, curl, jq)
RUN apt-get install -y git zip curl jq

# Retour à l'user jenkins
USER jenkins