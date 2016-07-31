CREATE DATABASE IF NOT EXISTS homework3;

USE homework3;

DROP Table Data;

CREATE TABLE Data (
  BidID STRING,
  Time_stamp STRING,
  LogType INT,
  iPinyouID STRING,
  UserAgent STRING,
  IP STRING,
  Region INT,
  City INT,
  AdExchange INT,
  Domain STRING,
  URL STRING,
  AnonymousURLID STRING,
  AdSlotID STRING,
  AdSlotWidth INT,
  AdSlotHeight INT,
  AdSlotVisibility STRING,
  AdSlotFormat STRING,
  AdSlotFloorPrice INT,
  CreativeID STRING,
  BiddingPrice INT,
  PayingPrice INT,
  KeyPageURL STRING,
  AdvertiserID INT,
  UserTags STRING
) row format delimited fields terminated by '\t' stored as textfile;

LOAD DATA INPATH '/user/maria_dev/imp.20131019.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131020.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131021.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131022.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131023.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131024.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131025.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131026.txt' INTO TABLE Data;
LOAD DATA INPATH '/user/maria_dev/imp.20131027.txt' INTO TABLE Data;