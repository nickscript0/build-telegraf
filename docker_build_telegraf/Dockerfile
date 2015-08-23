# WORKING: This builds telegraf from latest source
FROM golang

RUN apt-get update
RUN apt-get install wget -y

WORKDIR /scripts
ADD build.sh /scripts/build.sh

VOLUME ["/go"]
CMD ["/scripts/build.sh"]
