FROM collonvtom/ml:latest
RUN pip3 install --upgrade pip setuptools
RUN pip3 install jupyter seaborn matplotlib mpld3
VOLUME /home
EXPOSE 8888
WORKDIR /home/
CMD jupyter-notebook --ip=0.0.0.0 --port=8888 --allow-root