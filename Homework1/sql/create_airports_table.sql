CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table AirPorts;

CREATE TABLE AirPorts (
  iata STRING,
  airport STRING,
  city STRING,
  state STRING,
  country STRING,
  lat FLOAT,
  long FLOAT
) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
  stored as textfile
  tblproperties("skip.header.line.count"="1");

LOAD DATA INPATH '/user/maria_dev/airports.csv' OVERWRITE INTO TABLE AirPorts;