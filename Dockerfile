FROM ubuntu:14.04

MAINTAINER Dannon Baker <dannon.baker@gmail.com>

ADD https://github.com/gt1/biobambam/releases/download/0.0.174-release-20141024073944/biobambam-0.0.174-release-20141024073944-x86_64-unknown-linux-gnu-gcc-4.9.1-debian-etch.tar.xz biobambam_pkg.tar.xz

RUN apt-get update && apt-get install -y xz-utils && \
    tar -xf biobambam_pkg.tar.xz && \
    cp -r biobambam-0.0.174-release-20141024073944-x86_64-unknown-linux-gnu-gcc-4.9.1-debian-etch/* /usr/local/ && \
    rm -rf biobambam*

ENV PATH $PATH:/usr/local/bin
