DROP TABLE mapping_schema;

CREATE EXTERNAL TABLE IF NOT EXISTS mapping_schema 
(
metro_name_zillow string,
metro_region_id_zillow string,
cbsa_code string,
state string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/metro_mapping';