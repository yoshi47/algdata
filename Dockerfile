FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libzmq3-dev \
    unzip \
    && apt-get clean

# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt \
#     && rm -rf ~/.cache/pip

RUN conda install -c conda-forge \
    xeus-cling \
    jupyterlab-git

# RUN wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
# RUN chmod +x cpt.py
# RUN ./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/

# ENV PATH=/cling-install-prefix/bin:$PATH
# RUN cd /cling-install-prefix/share/cling/Jupyter/kernel

# RUN pip install -e .

RUN jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp11 && \
    jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp14 && \
    jupyter kernelspec install /opt/conda/share/jupyter/kernels/xcpp17