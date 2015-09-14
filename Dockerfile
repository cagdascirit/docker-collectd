FROM debian:jessie

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
	apt-get -y install collectd && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY collectd.conf /etc/collectd/

CMD ["collectd","-f"]
