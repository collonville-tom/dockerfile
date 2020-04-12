FROM ubuntu:latest

RUN apt-get -yqq update  \
    && apt-get install -y --no-install-recommends openssh-server python3 python3-pip python3-dev curl gnupg2 libglib2.0-0 libnss3 libx11-6 openjdk-11-jre tzdata curl unzip firefox

RUN pip3 install setuptools Wheel 
RUN pip3 install ansible Flask requests bson==0.5.7 pymongo==3.7.2 python_http_client lxml 

RUN apt-get -yqq update  \
    && apt-get install -y --no-install-recommends iputils-ping

RUN mkdir -p /work_dir 
WORKDIR /work_dir 

VOLUME /work_dir
VOLUME /root/.ssh/


CMD /bin/bash -c "/work_dir/runInDocker.sh"