FROM r-base:4.5.2


RUN apt-get update && apt-get install -y --no-install-recommends \
	bash git nano vim \
	python3 python3-pip python3-dev \
	python3-venv \
	build-essential \
	libssl-dev \
	libffi-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Contourner PEP 668 : utiliser le flag --break-system-packages en conteneur (accepté ici)
# Alternative : créer un venv mais ce n'est pas nécessaire en conteneur isolé
RUN python3 -m pip install --no-cache-dir --break-system-packages --upgrade setuptools wheel
RUN python3 -m pip install --no-cache-dir --break-system-packages jupyter

RUN echo 'install.packages(c("repr", "IRdisplay", "evaluate", "crayon", "pbdZMQ", "IRkernel", "uuid", "digest"))' | r
RUN echo 'IRkernel::installspec()' | r
RUN echo 'IRkernel::installspec(user = FALSE)' | r 

VOLUME /home
EXPOSE 8888
WORKDIR /home/
CMD jupyter-notebook --ip=0.0.0.0 --port=8888 --allow-root