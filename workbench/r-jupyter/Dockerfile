FROM r-base:4.5.2
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3.13-venv
RUN python3 -m venv /r-base 
RUN /r-base/bin/pip install jupyter
#python3-pip python3-dev python3-setuptools \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/
#RUN pip install jupyter
RUN echo 'install.packages(c("repr", "IRdisplay", "evaluate", "crayon", "pbdZMQ", "IRkernel", "uuid", "digest"))' | r
RUN echo 'IRkernel::installspec()' | r
RUN echo 'IRkernel::installspec(user = FALSE)' | r 
VOLUME /home
EXPOSE 8888
WORKDIR /home/
CMD jupyter-notebook --ip=0.0.0.0 --port=8888 --allow-root