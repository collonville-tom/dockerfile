#!/bin/bash


jupyter-notebook --ip=0.0.0.0 --port=8888 --allow-root --config=/home/$1/.jupyter/jupyter_notebook_config.py &

/usr/local/sbin/entrypoint.sh shellinabox



