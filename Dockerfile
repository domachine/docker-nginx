FROM ubuntu:quantal
MAINTAINER dominik.burgdoerfer@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe" >/etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q openssh-server \
    nginx \
    supervisor \
    pwgen
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /start
ENV TZ Europe/Berlin
EXPOSE 22 80
CMD ["/bin/bash", "/start"]
