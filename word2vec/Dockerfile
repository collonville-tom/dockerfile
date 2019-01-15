FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install -y --no-install-recommends build-essential gcc make wget\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/
COPY . /home 
WORKDIR /home
RUN make
CMD /bin/bash