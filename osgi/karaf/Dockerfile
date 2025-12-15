FROM openjdk:8u92-jre-alpine

RUN apk add --no-cache ca-certificates wget openssl

RUN wget --no-check-certificate https://dlcdn.apache.org/karaf/4.4.9/apache-karaf-4.4.9.tar.gz \
&& tar zxvpf apache-karaf-4.4.9.tar.gz && rm apache-karaf-4.4.9.tar.gz

COPY . /
CMD cd /apache-karaf-4.4.9/bin; ./karaf

