FROM ubuntu:22.04

WORKDIR /home/ubuntu

# system packages
RUN apt-get update && apt-get -y install \
    scons doxygen graphviz python3-pip nodejs npm

# python packages
ADD requirements.txt /home/ubuntu
RUN pip3 install -r requirements.txt

# node.js packages
RUN npm install -g `cat npm-packages.txt`
