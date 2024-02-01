FROM debian:latest
RUN apt-get -y update && apt-get -y install ansible sudo
# RUN apt-get -y update && apt-get -y install sudo
