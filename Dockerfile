# image name lzh/openstackbase:liberty
FROM centos:7

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2015-12-03
ENV OPENSTACK_VERSION liberty

RUN yum install -y deltarpm

RUN yum install -y epel-release centos-release-openstack-liberty

RUN yum update -y

RUN yum install -y MySQL-python crudini mariadb supervisor

RUN yum clean all

RUN rm -rf /var/cache/yum/*

RUN mv mv /etc/yum.repos.d/CentOS-OpenStack-liberty.repo mv /etc/yum.repos.d/CentOS-OpenStack-liberty.repo.orig
ADD CentOS-OpenStack-liberty.repo /etc/yum.repos.d/CentOS-OpenStack-liberty.repo

CMD ['/bin/bash']