FROM ubuntu:20.04

MAINTAINER Redheat
#RUN mkdir ~/.pip
#COPY files/docker/sources.list /etc/apt/
#COPY files/docker/pip.conf ~/.pip
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa -y && apt-get update -y
RUN apt-get install -y \
	apt-utils \
	git \
	python3.10 \
	python3.10-dev \
	python3.10-distutils \
    build-essential \
    libssl-dev \
    libffi-dev \
	curl \
	tzdata \
	libmysqlclient-dev && \
    rm -rf /usr/bin/python3 && ln -fs /usr/bin/python3.10 /usr/bin/python3 && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3 && \
	pip3 install -U pip setuptools requests && \
	ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata && \
	rm -rf /var/lib/apt/lists/*
