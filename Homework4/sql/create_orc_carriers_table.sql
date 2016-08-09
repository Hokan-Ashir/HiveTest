CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Carriers_ORC;

CREATE TABLE Carriers_ORC (
  Code STRING,
  Description STRING
) stored as orc tblproperties ("orc.compress"="NONE");

INSERT INTO TABLE Carriers_ORC SELECT * FROM Carriers;