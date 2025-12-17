FROM openjdk:8u92-jre-alpine

RUN apk add --no-cache ca-certificates wget openssl

# for reproductability mirror of http://apache.crihan.fr/dist/servicemix/servicemix-7/7.0.1/apache-servicemix-7.0.1.zip
RUN wget --no-check-certificate https://collonvillethomas.freeboxos.fr/public/tools/apache-servicemix-7.0.1.zip \
&& unzip apache-servicemix-7.0.1.zip && rm apache-servicemix-7.0.1.zip

COPY . /
CMD cd /apache-servicemix-7.0.1/bin; ./servicemix