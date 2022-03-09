FROM openjdk:8-jre-alpine

RUN wget http://apache.crihan.fr/dist/karaf/4.2.2/apache-karaf-4.2.2.tar.gz \
&& tar zxvpf apache-karaf-4.2.2.tar.gz && rm apache-karaf-4.2.2.tar.gz

COPY . /
CMD cd /apache-karaf-4.2.2/bin; ./karaf