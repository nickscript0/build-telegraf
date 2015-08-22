# WORKING: This builds telegraf from latest source
FROM golang

RUN apt-get update
RUN apt-get install wget -y
COPY telegraf.conf /etc/opt/telegraf/telegraf.conf

WORKDIR /go
RUN go get -u github.com/influxdb/telegraf/...
WORKDIR /go/src/github.com/influxdb/telegraf
RUN make

# RUN ./telegraf -config /etc/opt/telegraf/telegraf.conf
VOLUME ["/go"]
