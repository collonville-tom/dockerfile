# Utilisation d'une base JRE officielle (Debian-based)
FROM eclipse-temurin:21-jre-jammy

# Arguments pour la maintenance (à mettre à jour via ta CI)
ARG DOCKER_VERSION="25.0.3"
ARG SWARM_CLIENT_VERSION="3.44"
ARG JENKINS_UID="1000"
ARG JENKINS_GID="1000"

USER root


RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git jq unzip lsb-release \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce-cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /usr/share/jenkins \
    && curl -fsSL -o /usr/share/jenkins/swarm-client.jar \
    https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar

# 3. Sécurisation : Création de l'utilisateur non-privilégié
# Note: On ne hardcode pas le GID Docker ici, on le gérera dynamiquement via le docker-compose (group_add)
RUN groupadd -g ${JENKINS_GID} jenkins \
    && useradd -m -d /home/jenkins -u ${JENKINS_UID} -g jenkins -s /bin/bash jenkins \
    && mkdir -p /tmp/workspace \
    && chown -R jenkins:jenkins /tmp/workspace /usr/share/jenkins

# Copie du script de démarrage
COPY --chown=jenkins:jenkins entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Drop des privilèges
USER jenkins
WORKDIR /tmp/workspace

ENTRYPOINT ["/entrypoint.sh"]