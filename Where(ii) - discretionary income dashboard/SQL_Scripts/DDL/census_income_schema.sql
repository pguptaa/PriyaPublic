DROP TABLE census_job_schema;

CREATE EXTERNAL TABLE IF NOT EXISTS census_job_schema
(
row_num int,
prim_state string,
area string,
area_name string,
occ_code string,
occ_title string,
occ_group string,
tot_emp int,
emp_prse float,
jobs_1000 float,
h_mean float,
a_mean float,
mean_prse float,
h_pct10 float,
h_pct25 float,
h_median float,
h_pct75 float,
h_pct90 float,
a_pct10 int,
a_pct25 int,
a_median int,
a_pct75 int,
a_pct90 int,
annual string,
hourly string

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/data_files/census_income';
