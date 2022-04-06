#!/bin/bash


jupyter-notebook --NotebookApp.notebook_dir=/home/$1/workspace --NotebookApp.base_url=/ml/$1/jupyter --ip=0.0.0.0 --port=8888 --allow-root --config=/home/$1/.jupyter/jupyter_notebook_config.py &

/usr/local/sbin/entrypoint.sh shellinabox



