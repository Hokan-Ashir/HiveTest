CREATE DATABASE IF NOT EXISTS homework3;

USE homework3;

DROP Table Cities;

CREATE TABLE Cities (
  code INT,
  name STRING
) row format delimited fields terminated by '\t' stored as textfile;

LOAD DATA INPATH '/user/maria_dev/city.en.txt' INTO TABLE Cities;