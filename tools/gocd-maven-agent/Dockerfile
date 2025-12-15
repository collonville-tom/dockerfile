FROM maven:3.6.1-jdk-11-slim
RUN mkdir -p /maven_work_dir
RUN mkdir -p /repolocal

VOLUME /maven_work_dir
VOLUME /repolocal
WORKDIR /maven_work_dir/
ENTRYPOINT mvn clean install -X -s ./settings.xml