CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Carriers;

CREATE TABLE Carriers (
  Code STRING,
  Description STRING
) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

  WITH SERDEPROPERTIES (
     "separatorChar" = "\,",
     "quoteChar"     = "\""
  )
    stored as textfile
    tblproperties("skip.header.line.count"="1");

LOAD DATA INPATH '/user/maria_dev/carriers.csv' OVERWRITE INTO TABLE Carriers;