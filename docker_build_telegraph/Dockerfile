# WORKING: This builds telegraf from latest source
FROM golang

RUN apt-get update
RUN apt-get install wget -y
COPY telegraf.conf /etc/opt/telegraf/telegraf.conf

WORKDIR /scripts
ADD build.sh /scripts/build.sh

# RUN ./telegraf -config /etc/opt/telegraf/telegraf.conf
VOLUME ["/go"]
CMD ["/scripts/build.sh"]
