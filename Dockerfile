# image name lzh/openstackbase:liberty
FROM centos:7

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2015-12-03
ENV OPENSTACK_VERSION liberty
ENV BUILD_VERSION 2015-12-28

ADD CentOS-OpenStack-liberty.repo /etc/yum.repos.d/CentOS-OpenStack-liberty.repo

RUN yum install -y deltarpm && \
         yum install -y epel-release && \
         yum update -y && \
         yum install -y MySQL-python crudini mariadb supervisor &&\
         rm -rf /var/cache/yum/*

RUN rm -rf /etc/localtime && \
         ln -s /usr/share/zoneinfo/Asia/Chongqing /etc/localtime

CMD ['/bin/bash']