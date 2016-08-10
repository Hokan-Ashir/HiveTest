CREATE INDEX carriers_code_index ON TABLE carriers (code)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;