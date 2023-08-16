FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libzmq3-dev \
    unzip \
    && apt-get clean

RUN conda install -c conda-forge \
    xeus-cling \
    jupyterlab-git

RUN jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp11 && \
    jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp14 && \
    jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp17