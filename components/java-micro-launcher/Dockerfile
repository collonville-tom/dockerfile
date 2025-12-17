FROM openjdk:15-ea-15-slim

RUN mkdir -p /app

ENV JAVA_OPTS=""
ENV JAR_NAME=""

VOLUME /app

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/${JAR_NAME}" ]