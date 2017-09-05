DROP TABLE aff_inc;

CREATE EXTERNAL TABLE IF NOT EXISTS aff_inc

(
regionname string,
regionid string,
sizerank int,
year int,
wage float
)

ROW FORMAT SERDE "org.apache.hadoop.hive.serde2.OpenCSVSerde"

WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar"  = '\\')

STORED AS TEXTFILE

LOCATION '/user/w205/data_files/aff_inc';

DROP TABLE traffic;

CREATE EXTERNAL TABLE IF NOT EXISTS traffic
(Urban_Area string, Population_Group string, Year int, Population int,
Pop_Rank int, Auto_Comm int, Fwy_Daily_VMOT int, St_Daily_VMOT int,
Cost_VOT float, Cost_CVOT_2 float, CC_Avg_State_Gas float, CC_Avg_State_Dies float,
Congested_Trav int, Congested_Sys int, Rush_Hrs int, AEFC_Total_Gal int,
AEFC_Rank int, AEFC_Gal_Per_Comm int, AEFC_Rank_2 int, AHOD_Total_Delay int,
AHOD_Rank int, AHOD_Per_Cons int, AHOD_Per_Cons_Rank int, TTI_Val int,
TTI_Rank int, CSI_Val int, CSI_Rank int, FPTI_Val int, FPTI_Rank int,
ACC_Total_Dollars float, ACC_Rank int, ACC_Per_Cons int, ACC_Rank_2 int,
Region_ID string
)

ROW FORMAT SERDE "org.apache.hadoop.hive.serde2.OpenCSVSerde"

WITH SERDEPROPERTIES (
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar"  = '\\')

STORED AS TEXTFILE

LOCATION '/user/w205/data_files/traffic';
