FROM mahasiah:32188/shellinabox:1.0.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends bash git nano vim python3 python3-pip python3-dev\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/

RUN pip3 install --upgrade pip setuptools
RUN pip3 install jupyter pandas scikit-learn scipy six  seaborn matplotlib mpld3


RUN mkdir -p /home/ansible-user/.ssh
RUN mkdir -p /home/ansible-user/workspace

WORKDIR /home/ansible-user/workspace

VOLUME /home
EXPOSE 8888

CMD jupyter-notebook --ip=0.0.0.0 --port=8888 --allow-root