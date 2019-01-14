FROM ubuntu:latest
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-dev\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/
RUN pip3 install --upgrade pip setuptools
RUN pip3 install numpy pandas scikit-learn scipy six 
CMD python3