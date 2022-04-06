FROM openjdk:8-jre-alpine

RUN wget https://dlcdn.apache.org/felix/org.apache.felix.main.distribution-7.0.3.zip \
&& unzip org.apache.felix.main.distribution-7.0.3.zip && rm org.apache.felix.main.distribution-7.0.3.zip

COPY . /felix-framework-7.0.3/
CMD cd /felix-framework-7.0.3; java -jar bin/felix.jar