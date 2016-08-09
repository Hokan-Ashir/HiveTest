CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table AirPorts_ORC;

CREATE TABLE AirPorts_ORC (
  iata STRING,
  airport STRING,
  city STRING,
  state STRING,
  country STRING,
  lat FLOAT,
  long FLOAT
) stored as orc tblproperties ("orc.compress"="NONE");

INSERT INTO TABLE AirPorts_ORC SELECT * FROM AirPorts;



CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Data_PARTITIONED;

CREATE TABLE Data_PARTITIONED (
  Year INT,
  Month INT,
  DayOfMonth INT,
  DayOfWeek INT,
  DepTime INT,
  CRSDepTime INT,
  ArrTime INT,
  CRSArrTime INT,
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
partitioned by (UniqueCarrier STRING)
row format delimited fields terminated by ','
stored as textfile tblproperties("skip.header.line.count"="1");
-- same for carriers; redeploy hdp

INSERT INTO TABLE Data_PARTITIONED Partition(UniqueCarrier) SELECT * FROM Data;



CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Carriers_PARTITIONED;

CREATE TABLE Carriers_PARTITIONED (
  Description STRING
)
partitioned by (Code STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

  WITH SERDEPROPERTIES (
     "separatorChar" = "\,",
     "quoteChar"     = "\""
  )
    stored as textfile
    tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE Carriers_PARTITIONED partition(Code) SELECT * FROM Carriers;


