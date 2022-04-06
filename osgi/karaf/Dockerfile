FROM openjdk:8-jre-alpine

RUN wget https://dlcdn.apache.org/karaf/4.2.15/apache-karaf-4.2.15.tar.gz \
&& tar zxvpf apache-karaf-4.2.15.tar.gz && rm apache-karaf-4.2.15.tar.gz

COPY . /
CMD cd /apache-karaf-4.2.15/bin; ./karaf

