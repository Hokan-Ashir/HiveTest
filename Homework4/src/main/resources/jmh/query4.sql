CREATE INDEX IF NOT EXISTS carriers_code_index ON TABLE carriers (code)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;

select result.cnt, carriers.code, carriers.description from
(select count(1) as cnt, uniquecarrier from data group by uniquecarrier order by cnt desc limit 1) as result
join
carriers
on result.UniqueCarrier = carriers.code;