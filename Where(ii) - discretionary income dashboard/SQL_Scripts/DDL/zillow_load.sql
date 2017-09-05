DROP TABLE 1bed;
DROP TABLE 2bed;
DROP TABLE 3bed;
DROP TABLE 4bed;
DROP TABLE 5bed;
DROP TABLE studio;

CREATE EXTERNAL TABLE IF NOT EXISTS 1bed (

	metro_name string,
	rank int,
	date string,
	price float

)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/1bed';

CREATE EXTERNAL TABLE IF NOT EXISTS 2bed (
	metro_name string,
	rank int,
	date string,
	price float

)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/2bed';

CREATE EXTERNAL TABLE IF NOT EXISTS 3bed (
	metro_name string,
	rank int,
	date string,
	price float
)


ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/3bed';

CREATE EXTERNAL TABLE IF NOT EXISTS 4bed (
	metro_name string,
	rank int,
	date string,
	price float
)


ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/4bed';


CREATE EXTERNAL TABLE IF NOT EXISTS 5bed (
	metro_name string,
	rank int,
	date string,
	price float
)


ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/5bed';

CREATE EXTERNAL TABLE IF NOT EXISTS studio (
	metro_name string,
	rank int,
	date string,
	price float
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/studio';
