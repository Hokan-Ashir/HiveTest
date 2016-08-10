CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Data_CLUSTERED;

CREATE TABLE Data_CLUSTERED (
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
)
clustered by (UniqueCarrier) into 32 buckets
row format delimited fields terminated by ','
stored as textfile tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE Data_CLUSTERED SELECT * FROM Data;