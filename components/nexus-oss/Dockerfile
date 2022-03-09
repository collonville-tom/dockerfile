FROM openjdk:8u322-slim-buster

ENV NEXUS_USER_NAME=nexus \
    NEXUS_HOME=/opt/sonatype 

RUN mkdir -p $NEXUS_HOME

# unzip nexus-3.38.0-01.zip in build directory
COPY nexus-3.38.0-01 ${NEXUS_HOME}/nexus

RUN set -ex \
    sed -i "s/nofiles/${NEXUS_USER_NAME}/" /etc/group \
    && addgroup --system ${NEXUS_USER_NAME} \
    && adduser --disabled-login --system ${NEXUS_USER_NAME} \
    && chown -R ${NEXUS_USER_NAME}:${NEXUS_USER_NAME} ${NEXUS_HOME} \
    && chmod +x ${NEXUS_HOME}

EXPOSE 8081

USER ${NEXUS_USER_NAME}

ENTRYPOINT ${NEXUS_HOME}/nexus/bin/nexus run