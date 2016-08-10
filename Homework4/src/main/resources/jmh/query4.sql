select result.cnt, carriers.code, carriers.description from
(select count(1) as cnt, uniquecarrier from data group by uniquecarrier order by cnt desc limit 1) as result
join
carriers
on result.UniqueCarrier = carriers.code