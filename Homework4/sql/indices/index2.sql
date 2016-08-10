CREATE INDEX data_uniquecarrier_index ON TABLE data (uniquecarrier)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;