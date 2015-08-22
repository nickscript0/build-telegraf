# Modeled off of https://github.com/influxdb/influxdb/blob/master/Dockerfile
FROM debian:jessie

RUN apt-get update
RUN apt-get install wget -y

# admin, http
EXPOSE 8083 8086
# Comment out udp, cluster, graphite, opentsdb, collectd
# EXPOSE 8086/udp 8088 2003 4242 25826

WORKDIR /app

RUN wget https://s3.amazonaws.com/influxdb/influxdb_0.9.3-rc2_amd64.deb
RUN dpkg -i influxdb_0.9.3-rc2_amd64.deb

# Generate a default config
RUN /opt/influxdb/influxd config > /etc/influxdb.toml

# Use /data for all disk storage
RUN sed -i 's/dir = "\/.*influxdb/dir = "\/data/' /etc/influxdb.toml

#VOLUME ["/data"]

ENTRYPOINT ["/opt/influxdb/influxd", "--config", "/etc/influxdb.toml"]
