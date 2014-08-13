
FROM ubuntu:14.04

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# install wget
RUN apt-get update &&\
    apt-get -y install wget &&\
    apt-get clean

# install remote_syslog2
RUN wget https://github.com/papertrail/remote_syslog2/releases/download/v0.13/remote_syslog_linux_amd64.tar.gz &&\
    tar -zxf remote_syslog_linux_amd64.tar.gz &&\
    mv /remote_syslog/remote_syslog /usr/local/bin/ &&\
    chmod +x /usr/local/bin/remote_syslog &&\
    rm -rf /remote_syslog*

ENTRYPOINT ["remote_syslog", "-D"]
