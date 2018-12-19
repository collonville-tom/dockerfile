FROM maven:3.6.0-jdk-8-alpine
RUN mkdir -p /maven_work_dir
RUN mkdir -p /repolocal
COPY settings.xml /usr/share/maven/conf/settings.xml
VOLUME /maven_work_dir
VOLUME /repolocal
WORKDIR /maven_work_dir/
ENTRYPOINT mvn clean install -X