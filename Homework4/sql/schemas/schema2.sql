CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table AirPorts_PARTITIONED_NYC;

CREATE TABLE AirPorts_PARTITIONED_NYC (
  iata STRING,
  airport STRING,
  state STRING,
  country STRING,
  lat STRING,
  long STRING
) partitioned by (city STRING)
row format delimited fields terminated by ','
stored as textfile tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE AirPorts_PARTITIONED_NYC Partition(city = 'New York') SELECT iata, airport, state, country, lat, long FROM AirPorts;