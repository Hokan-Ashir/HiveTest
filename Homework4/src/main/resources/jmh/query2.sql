select count(1) from (
select * from data JOIN airports on (data.Origin = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 UNION
 select * from data JOIN airports on (data.Dest = airports.iata)
  where data.Month = 6 and airports.city = 'New York'
 ) as result