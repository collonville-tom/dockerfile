FROM maven:3.6.0-jdk-8-alpine
RUN mkdir -p /maven_work_dir
COPY settings.xml /usr/share/maven/conf/settings.xml
ONBUILD COPY . /maven_work_dir/
ONBUILD ENTRYPOINT mvn clean install 