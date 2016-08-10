CREATE INDEX IF NOT EXISTS airports_city_index ON TABLE airports (city)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;

select count(1) from (
select * from data JOIN airports on (data.Origin = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 UNION
 select * from data JOIN airports on (data.Dest = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 ) as result;