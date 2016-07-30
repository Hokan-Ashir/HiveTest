--!connect jdbc:hive2://sandbox.hortonworks.com:10000/homework1 hive hive org.apache.hive.jdbc.HiveDriver

--Count total number of flights per carrier in 2007
select count(1), uniquecarrier from data group by uniquecarrier;

--The total number of flights served in Jun 2007 by NYC (all airports, use join with Airports data)
--TODO data.Origin is a number, "should be" a IATA of an airport from airports table, but those table have only strings
select count(1) from (
select * from data JOIN airports on (data.Origin = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 UNION
 select * from data JOIN airports on (data.Dest = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 ) as result;

--Find five most busy airports in US during Jun 01 - Aug 31
--TODO should additional check in where be performed? country == USA
select count(1) as cnt, result.iata from (
  select * from data JOIN airports on (data.Origin = airports.iata)
  where data.Month >= 6 and data.Month <= 8
 UNION
 select * from data JOIN airports on (data.Dest = airports.iata)
  where data.Month >= 6 and data.Month <= 8
) as result

group by result.iata
order by cnt desc limit 5;

--Find the carrier who served the biggest number of flights
--TODO should be additional join performed? with carriers table
select count(1) as cnt, uniquecarrier from data group by uniquecarrier order by cnt desc limit 1;