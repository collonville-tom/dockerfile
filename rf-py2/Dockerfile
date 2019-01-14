FROM ubuntu:latest
RUN apt-get update && apt-get install -y --no-install-recommends python python-pip python-dev\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/
RUN pip install setuptools Wheel
RUN pip install robotframework robotframework-databaselibrary robotframework-seleniumlibrary \
				robotframework-sudslibrary selenium suds 
CMD python


