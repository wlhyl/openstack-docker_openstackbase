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

CMD ['/bin/bash']