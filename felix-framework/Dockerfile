FROM openjdk:8-jre-alpine

RUN wget http://mirror.ibcp.fr/pub/apache//felix/org.apache.felix.main.distribution-6.0.1.tar.gz \
&& tar zxvpf org.apache.felix.main.distribution-6.0.1.tar.gz && rm org.apache.felix.main.distribution-6.0.1.tar.gz

COPY . /felix-framework-6.0.1/
CMD cd /felix-framework-6.0.1; java -jar bin/felix.jar