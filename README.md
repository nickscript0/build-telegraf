# Build InfluxDB Telegraf
## Overview
A docker-compose environment for building and developing InfluxDB Telegraf

## Usage
### Run Influxdb
```bash
docker-compose up -d influxdb
# Go to localhost:8083 in a web browser
```

### Build and run telegraf from source
*Warning: If you're on a limited internet connection, running this the first time will download about 200MB of dependencies*
```bash
# "go get" and build telegraf
docker-compose up -d buildtelegraf
# All the telegraf go src and dependencies are now available on your host in
# folder docker_build_telegraf/src

# Run telegraf
docker-compose run buildtelegraf /bin/bash
cd /go/src/github.com/nickscript0/telegraf/
./telegraf -config /etc/opt/telegraf/telegraf.conf
```

## Sample InfluxDB queries
```sql
select * from cpu_system where cpu = 'cpu-total' AND time > now() - 2m
```
