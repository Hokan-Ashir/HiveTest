CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Carriers_CLUSTERED;

CREATE TABLE Carriers_CLUSTERED (
  Code STRING,
  Description STRING
) clustered by (Code) into 32 buckets
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

  WITH SERDEPROPERTIES (
     "separatorChar" = "\,",
     "quoteChar"     = "\""
  )
    stored as textfile
    tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE Carriers_CLUSTERED SELECT * FROM Carriers;