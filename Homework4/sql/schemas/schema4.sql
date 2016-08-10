CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table AirPorts_CLUSTERED;

CREATE TABLE AirPorts_CLUSTERED (
  iata STRING,
  airport STRING,
  city STRING,
  state STRING,
  country STRING,
  lat STRING,
  long STRING
) clustered by (city) into 32 buckets
row format delimited fields terminated by ','
stored as textfile tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE AirPorts_CLUSTERED SELECT * FROM AirPorts;