FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

LABEL maintainer ruida@nih.gov

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
	vim \
	python-tk \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools \
	python-h5py \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip

ENV CAFFE_ROOT=/hnn
WORKDIR $CAFFE_ROOT


COPY . $CAFFE_ROOT

RUN cd $CAFFE_ROOT && \
    cd python && for req in $(cat requirements.txt) pydot; do pip install --no-cache-dir $req; done && cd .. && \
    git clone https://github.com/NVIDIA/nccl.git && cd nccl && make -j install && cd .. && rm -rf nccl && \
    mkdir build && cd build && \
    cmake -DUSE_CUDNN=0 -DUSE_NCCL=0 -DCUDA_ARCH_NAME=All .. && \
    make -j"$(nproc)"

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $CAFFE_ROOT/python:$PYTHONPATH
ENV PATH $CAFFE_ROOT/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

WORKDIR $CAFFE_ROOT
