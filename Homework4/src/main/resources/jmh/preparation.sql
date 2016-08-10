-- you have to manually launch it via ambari or hive CLI or beeline CLI, cause hive-jdbc can't handle queries without resultset

DROP INDEX airports_city_index on airports;

CREATE INDEX airports_city_index ON TABLE airports (city) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;

DROP INDEX carriers_code_index on carriers;

CREATE INDEX carriers_code_index ON TABLE carriers (code) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;

