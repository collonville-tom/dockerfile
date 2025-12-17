FROM collonvillethomas.freeboxos.fr:5000/shell-in-the-box:0.1.0

ENV DEBIAN_FRONTEND=noninteractive

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
RUN python3 -m pip install --no-cache-dir --break-system-packages jupyter pandas scikit-learn scipy six seaborn matplotlib mpld3


EXPOSE 8888

ADD assets/entrypoint-jup.sh /usr/local/sbin/entrypoint-jup.sh


