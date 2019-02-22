FROM ubuntu:latest
RUN apt-get update && apt-get install -y --no-install-recommends gnu-smalltalk\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/
WORKDIR /source