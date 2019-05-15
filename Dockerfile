# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

#RUN apt-get update && apt-get -y install git

#jupyter_contrib_nbextionsions not needed, nice to have
RUN conda config --add channels oxfordcontrol && \
	conda install -c conda-forge lapack jupyter_contrib_nbextensions && \
	conda install -c cvxgrp cvxpy=1.0.21 && \
#	conda install --quiet --yes \
	conda install --yes \
	'slycot' \
	'numpy' \
	'matplotlib' \
	'control' \
	'nose' && \
	conda clean --all -f -y
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
