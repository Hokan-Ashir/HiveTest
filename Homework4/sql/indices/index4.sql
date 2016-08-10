CREATE INDEX airports_city_index ON TABLE airports (city)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;