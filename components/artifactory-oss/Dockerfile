FROM openjdk:15-slim-buster

ENV ARTIFACTORY_USER_NAME=artifactory \
    ARTIFACTORY_HOME=/opt/jfrog/artifactory  

RUN mkdir /opt/jfrog
# unzip artifactory-oss-7.9.2.zip in build directory
COPY artifactory-oss-7.9.2 ${ARTIFACTORY_HOME}

RUN set -ex \
    sed -i "s/nofiles/${ARTIFACTORY_USER_NAME}/" /etc/group \
    && addgroup --system ${ARTIFACTORY_USER_NAME} \
    && adduser --disabled-login --system ${ARTIFACTORY_USER_NAME} \
    && chown -R ${ARTIFACTORY_USER_NAME}:${ARTIFACTORY_USER_NAME} ${ARTIFACTORY_HOME} 

EXPOSE 8081

ENTRYPOINT ${ARTIFACTORY_HOME}/app/bin/artifactory.sh