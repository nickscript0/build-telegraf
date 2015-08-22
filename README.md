# Run Latest InfluxDB
## Overview
Simple Docker container that runs the latest pre-built InfluxDB package

## Usage
```bash
docker-compose up -d
# Go to localhost:8083 in a web browser
```

## Sample queries
```sql
select * from cpu_system where cpu = 'cpu-total' AND time > now() - 2m
```
