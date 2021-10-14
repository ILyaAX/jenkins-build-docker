FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN apt install wget -y
RUN apt install docker.io
RUN apt-get clean