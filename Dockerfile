FROM centos:7
MAINTAINER RenFei <i@renfei.net>

WORKDIR /opt/CSE

ADD Local-CSE-2.1.5-linux-amd64.zip ./

RUN yum update -y && yum install unzip -y && unzip Local-CSE-2.1.5-linux-amd64.zip

EXPOSE 30100 30103 30110

ENTRYPOINT ["/opt/CSE/start.sh"]