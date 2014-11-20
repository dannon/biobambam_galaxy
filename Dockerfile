FROM ubuntu:14.04

MAINTAINER Dannon Baker <dannon.baker@gmail.com>

# Too fresh, these had issues!
#ADD https://github.com/gt1/biobambam/archive/0.0.180-release-20141115112609.tar.gz biobambam.tar.gz
#ADD https://github.com/gt1/libmaus/archive/0.0.179-release-20141119194238.tar.gz libmaus.tar.gz

ADD https://github.com/gt1/biobambam/archive/0.0.174-release-20141024073944.tar.gz biobambam.tar.gz
ADD https://github.com/gt1/libmaus/archive/0.0.174-release-20141112090726.tar.gz libmaus.tar.gz

RUN apt-get update && apt-get install -y build-essential \
    g++ \
    git \
    cmake \
    zlib1g-dev \
    libboost-date-time-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    automake \
    pkg-config

ENV BOOST_ROOT /usr

RUN tar -xf libmaus.tar.gz
RUN cd  libmaus-0.0.174-release-20141112090726/ && \
    ./configure && \
    make && make install

RUN tar -xf biobambam.tar.gz
RUN cd ../biobambam-0.0.174-release-20141024073944/ && \
    ./configure && \
    make && make install

RUN cd ../ && rm libmaus.tar.gz && rm biobambam.tar.gz

RUN ldconfig
