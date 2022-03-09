FROM openjdk:15-slim-buster

RUN mkdir -p /app

VOLUME /app

ENV JAVA_OPTS=""
ENV JAR_NAME=""

COPY ./target/${JAR_NAME} /app

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/${JAR_NAME}" ]