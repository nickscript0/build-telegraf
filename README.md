# Run Latest InfluxDB
## Overview
Simple Docker container that runs the latest pre-built InfluxDB package

## Usage
### Run Influxdb
```bash
docker-compose up -d influxdb
# Go to localhost:8083 in a web browser
```
### Build and run telegraf from source
Waring: Running this the first time will take a while as it downloads about 200MB of dependencies and builds them
```bash
# "go get" and build telegraf
docker-compose up -d buildtelegraf
# All the telegraf go src and dependencies are now available on your host in
# folder docker_build_telegraf/src

# Run telegraf
docker-compose run buildtelegraf /bin/bash
cd /go/src/github.com/influxdb/telegraf/
./telegraf -config /etc/opt/telegraf/telegraf.conf


```

## Sample queries
```sql
select * from cpu_system where cpu = 'cpu-total' AND time > now() - 2m
```
