# image name lzh/openstackbase:kilo
FROM ubuntu:trusty

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2015-09-16
ENV OPENSTACK_VERSION kilo


ENV DEBIAN_FRONTEND noninteractive

RUN echo "Asia/Shanghai" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

RUN echo "deb http://debian.ustc.edu.cn/ubuntu trusty main restricted multiverse universe" > /etc/apt/sources.list
RUN echo "deb http://debian.ustc.edu.cn/ubuntu trusty-security main restricted multiverse universe" >> /etc/apt/sources.list
RUN echo "deb http://debian.ustc.edu.cn/ubuntu trusty-updates main restricted multiverse universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install python-mysqldb crudini mariadb-client supervisor ubuntu-cloud-keyring -y
RUN apt-get clean

RUN echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" \
  "trusty-updates/kilo main" > /etc/apt/sources.list.d/cloudarchive-kilo.list

RUN apt-get update && apt-get dist-upgrade -y && apt-get clean

RUN env --unset=DEBIAN_FRONTEND

CMD ['/bin/bash']