select result.cnt, carriers_orc.code, carriers_orc.description from
(select count(1) as cnt, uniquecarrier from data_orc group by uniquecarrier order by cnt desc) as result
join
carriers_orc
on result.UniqueCarrier = carriers_orc.code