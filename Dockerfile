FROM ubuntu:15.04
MAINTAINER Ubuntu 15.04

RUN apt-get update
RUN apt-get -y install openssh-server
RUN echo "Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc" >> /etc/ssh/sshd_config
RUN update-rc.d ssh defaults
RUN apt-get -y install libaio1 libaio-dev perl libnuma-dev
RUN apt-get -y install vim dpkg sudo net-tools
VOLUME /apps
ADD ./mysql-cluster-gpl-7.4.8-debian7-x86_64.deb /apps/mysql-cluster-gpl-7.4.8-debian7-x86_64.deb
RUN dpkg -i /apps/mysql-cluster-gpl-7.4.8-debian7-x86_64.deb

ADD ./mysql-cluster-setup.sh /tmp/mysql-cluster-setup.sh
RUN /bin/bash /tmp/mysql-cluster-setup.sh

EXPOSE 3306