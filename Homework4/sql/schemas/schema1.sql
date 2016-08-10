CREATE DATABASE IF NOT EXISTS homework1;

USE homework1;

DROP Table Data_PARTITIONED;

CREATE TABLE Data_PARTITIONED (
  Year INT,
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
partitioned by (Month INT)
row format delimited fields terminated by ','
stored as textfile tblproperties("skip.header.line.count"="1");

INSERT INTO TABLE Data_PARTITIONED Partition(Month = 1) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
 CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
  Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
  LateAircraftDelay FROM Data;
INSERT INTO TABLE Data_PARTITIONED Partition(Month = 2) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
 CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
  Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
  LateAircraftDelay FROM Data;
INSERT INTO TABLE Data_PARTITIONED Partition(Month = 3) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
   CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
    Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
    LateAircraftDelay FROM Data;
INSERT INTO TABLE Data_PARTITIONED Partition(Month = 4) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
     CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
      Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
      LateAircraftDelay FROM Data;
INSERT INTO TABLE Data_PARTITIONED Partition(Month = 5) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
       CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
        Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
        LateAircraftDelay FROM Data;
        INSERT INTO TABLE Data_PARTITIONED Partition(Month = 6) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
         CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
          Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
          LateAircraftDelay FROM Data;
          INSERT INTO TABLE Data_PARTITIONED Partition(Month = 7) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
           CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
            Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
            LateAircraftDelay FROM Data;
            INSERT INTO TABLE Data_PARTITIONED Partition(Month = 8) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
             CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
              Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
              LateAircraftDelay FROM Data;
              INSERT INTO TABLE Data_PARTITIONED Partition(Month = 9) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
               CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
                Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
                LateAircraftDelay FROM Data;
                INSERT INTO TABLE Data_PARTITIONED Partition(Month = 10) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
                 CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
                  Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
                  LateAircraftDelay FROM Data;
                  INSERT INTO TABLE Data_PARTITIONED Partition(Month = 11) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
                   CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
                    Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
                    LateAircraftDelay FROM Data;
                    INSERT INTO TABLE Data_PARTITIONED Partition(Month = 12) SELECT Year, DayOfMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
                     CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,
                      Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
                      LateAircraftDelay FROM Data;