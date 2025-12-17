 
FROM ubuntu:26.04

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-dev\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/

RUN python3 -m pip install --no-cache-dir --break-system-packages --upgrade setuptools wheel
RUN python3 -m pip install --no-cache-dir --break-system-packages flask flask-cors 
