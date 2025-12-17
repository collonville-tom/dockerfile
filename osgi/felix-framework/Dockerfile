FROM openjdk:8u92-jre-alpine

RUN apk add --no-cache ca-certificates wget openssl


# for reproductability mirror of https://dlcdn.apache.org/felix/org.apache.felix.main.distribution-7.0.5.zip 
RUN wget --no-check-certificate https://collonvillethomas.freeboxos.fr/public/tools/org.apache.felix.main.distribution-7.0.5.zip \
&& unzip org.apache.felix.main.distribution-7.0.5.zip && rm org.apache.felix.main.distribution-7.0.5.zip

COPY . /felix-framework-7.0.5/
CMD cd /felix-framework-7.0.5; java -jar bin/felix.jar