select count(1) as cnt, result.iata from (
  select * from data JOIN airports on (data.Origin = airports.iata)
  where data.Month >= 6 and data.Month <= 8
 UNION
 select * from data JOIN airports on (data.Dest = airports.iata)
  where data.Month >= 6 and data.Month <= 8
) as result
group by result.iata
order by cnt desc limit 5;