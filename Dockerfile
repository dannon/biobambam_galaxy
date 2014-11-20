FROM ubuntu:14.04

MAINTAINER Dannon Baker <dannon.baker@gmail.com>

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:gt1/staden-io-lib-current
RUN add-apt-repository -y ppa:gt1/libmaus
RUN add-apt-repository -y ppa:gt1/biobambam
RUN apt-get update && apt-get install -y libmaus-dev biobambam
