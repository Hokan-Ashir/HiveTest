CREATE INDEX data_month_index ON TABLE data (Month)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;