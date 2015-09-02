# Modeled off of https://github.com/influxdb/influxdb/blob/master/Dockerfile
FROM debian:jessie

RUN apt-get update
RUN apt-get install wget -y

# admin, http
#EXPOSE 8083 8086
# Comment out udp, cluster, graphite, opentsdb, collectd
# EXPOSE 8086/udp 8088 2003 4242 25826

WORKDIR /app
ENV INFLUXDB_VERSION 0.9.3
RUN wget https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb
RUN dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb

# Generate a default config
RUN /opt/influxdb/influxd config > /etc/influxdb.toml

# Use /data for all disk storage
RUN sed -i 's/dir = "\/.*influxdb/dir = "\/data/' /etc/influxdb.toml

# Persist data
VOLUME ["/data"]

ENTRYPOINT ["/opt/influxdb/influxd", "--config", "/etc/influxdb.toml"]
