FROM debian:jessie

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://httpredir.debian.org/debian stretch main contrib" | tee -a /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get -y install collectd && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	sed -i '$ d' /etc/apt/sources.list

COPY collectd.conf /etc/collectd/

CMD ["collectd","-f"]
