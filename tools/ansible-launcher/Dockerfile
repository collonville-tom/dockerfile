FROM ubuntu:latest

RUN apt-get -yqq update  \
    && apt-get install -y --no-install-recommends git openssh-server sshpass python3 python3-pip python3-dev python3-venv curl gnupg2 libglib2.0-0 libnss3 libx11-6 curl unzip \
    && apt-get install -y --no-install-recommends iputils-ping \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/

RUN python3 -m venv /py-ansi
RUN /py-ansi/bin/pip install setuptools Wheel 
RUN /py-ansi/bin/pip install ansible Flask requests bson==0.5.7 pymongo==3.7.2 python_http_client lxml 


RUN mkdir -p /work_dir 

VOLUME /work_dir

ENV ANSIBLE_USER=""
ENV ANSIBLE_PWD=""

WORKDIR /work_dir

CMD /py-ansi/bin/ansible-playbook -i inventaire.ini --user ${ANSIBLE_USER} --extra-vars "ansible_sudo_pass=${ANSIBLE_PWD} ansible_password=${ANSIBLE_PWD}" main.yml
