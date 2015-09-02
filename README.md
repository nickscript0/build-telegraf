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
Warning: Running this the first time will take a while as it downloads about 200MB of dependencies and builds them
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

### Dev workflow
```bash
docker-compose run buildtelegraf /bin/bash

# Instead of updating the go library to use nickscript0/telegraf, just replace in the tree
cd /go/src/github.com/influxdb
rm -rf telegraf
git clone https://github.com/nickscript0/telegraf.git
cd telegraf
make

# Make a change to the source, the build and run it
make
./telegraf -config /etc/opt/telegraf/telegraf.conf

```

## Sample InfluxDB queries
```sql
select * from cpu_system where cpu = 'cpu-total' AND time > now() - 2m
```
