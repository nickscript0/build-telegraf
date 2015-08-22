#!/bin/sh
cd /go
echo "Running go get..."
#go get -u github.com/influxdb/telegraf/...
go get -u github.com/nickscript0/telegraf/...
cd /go/src/github.com/influxdb/telegraf
echo "Running make..."
make
echo "Done."
