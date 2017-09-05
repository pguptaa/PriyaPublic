DROP TABLE 1bed_pt;
DROP TABLE 2bed_pt;
DROP TABLE 3bed_pt;
DROP TABLE 4bed_pt;
DROP TABLE 5bed_pt;
DROP TABLE studio_pt;
DROP TABLE rental_pricing;

CREATE TABLE IF NOT EXISTS 1bed_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	1bed.metro_name as metro_name, 
	1bed.date as price_date, 
	1bed.price as price_usd, 
	CASE WHEN 1bed.metro_name is not null THEN "1" END as bed_df
FROM 1bed 
	LEFT JOIN mapping on (mapping.metro_name = 1bed.metro_name)
WHERE mapping.metro_id is not null
	and 1bed.price != "";
	
CREATE TABLE IF NOT EXISTS 2bed_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	2bed.metro_name as metro_name, 
	2bed.date as price_date, 
	2bed.price as price_usd, 
	CASE WHEN 2bed.metro_name is not null THEN "2" END as bed_df
FROM 2bed 
	LEFT JOIN mapping on (mapping.metro_name = 2bed.metro_name)
WHERE mapping.metro_id is not null
	and 2bed.price != "";
	
CREATE TABLE IF NOT EXISTS 3bed_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	3bed.metro_name as metro_name, 
	3bed.date as price_date, 
	3bed.price as price_usd, 
	CASE WHEN 3bed.metro_name is not null THEN "3" END as bed_df
FROM 3bed 
	LEFT JOIN mapping on (mapping.metro_name = 3bed.metro_name)
WHERE mapping.metro_id is not null
	and 3bed.price != "";
	
CREATE TABLE IF NOT EXISTS 4bed_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	4bed.metro_name as metro_name, 
	4bed.date as price_date, 
	4bed.price as price_usd, 
	CASE WHEN 4bed.metro_name is not null THEN "4" END as bed_df
FROM 4bed 
	LEFT JOIN mapping on (mapping.metro_name = 4bed.metro_name)
WHERE mapping.metro_id is not null
	and 4bed.price != "";

CREATE TABLE IF NOT EXISTS 5bed_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	5bed.metro_name as metro_name, 
	5bed.date as price_date, 
	5bed.price as price_usd, 
	CASE WHEN 5bed.metro_name is not null THEN "5" END as bed_df
FROM 5bed 
	LEFT JOIN mapping on (mapping.metro_name = 5bed.metro_name)
WHERE mapping.metro_id is not null
	and 5bed.price != "";

CREATE TABLE IF NOT EXISTS studio_pt AS
SELECT distinct
	mapping.metro_id as metro_id,
	studio.metro_name as metro_name, 
	studio.date as price_date, 
	studio.price as price_usd, 
	CASE WHEN studio.metro_name is not null THEN "0" END as bed_df
FROM studio
	LEFT JOIN mapping on (mapping.metro_name = studio.metro_name)
WHERE mapping.metro_id is not null
	and studio.price != "";

CREATE TABLE IF NOT EXISTS rental_pricing (
	metro_id STRING,
	metro_name STRING,
	price_date STRING,
	price_usd FLOAT
	)
PARTITIONED BY (bed_df STRING);

INSERT INTO rental_pricing
	PARTITION (bed_df = "1")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM 1bed_pt
WHERE bed_df = "1";


INSERT INTO rental_pricing
	PARTITION (bed_df = "2")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM 2bed_pt
WHERE bed_df = "2";

INSERT INTO rental_pricing
	PARTITION (bed_df = "3")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM 3bed_pt
WHERE bed_df = "3";

INSERT INTO rental_pricing
	PARTITION (bed_df = "4")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM 4bed_pt
WHERE bed_df = "4";

INSERT INTO rental_pricing
	PARTITION (bed_df = "5")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM 5bed_pt
WHERE bed_df = "5";


INSERT INTO rental_pricing
	PARTITION (bed_df = "0")
SELECT  metro_id,
	metro_name,
	price_date,
	price_usd
FROM studio_pt
WHERE bed_df = "0";


