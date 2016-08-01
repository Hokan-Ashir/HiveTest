CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Data;

CREATE TABLE Data (
  Year INT,
  Month INT,
  DayOfMonth INT,
  DayOfWeek INT,
  DepTime INT,
  CRSDepTime INT,
  ArrTime INT,
  CRSArrTime INT,
  UniqueCarrier STRING,
  FlightNum INT,
  TailNum STRING,
  ActualElapsedTime INT,
  CRSElapsedTime INT,
  AirTime INT,
  ArrDelay INT,
  DepDelay INT,
  Origin STRING,
  Dest STRING,
  Distance INT,
  TaxiIn INT,
  TaxiOut INT,
  Cancelled INT,
  CancellationCode STRING,
  Diverted INT,
  CarrierDelay INT,
  WeatherDelay INT,
  NASDelay INT,
  SecurityDelay INT,
  LateAircraftDelay INT
) row format delimited fields terminated by ',' stored as textfile tblproperties("skip.header.line.count"="1");

LOAD DATA INPATH '/user/maria_dev/2007.csv' OVERWRITE INTO TABLE Data;