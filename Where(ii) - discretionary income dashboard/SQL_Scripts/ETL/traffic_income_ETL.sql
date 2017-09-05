DROP TABLE city_income_traffic;

CREATE TABLE city_income_traffic AS
SELECT
	aff_inc.regionname as metro_name,
	aff_inc.regionid as metro_id,
	aff_inc.year as aff_date,
	aff_inc.wage as wage_usd,
	traffic.region_id as metro_id2,
	SUBSTRING(traffic.year,1,4) as year,
	traffic.population as population,
	traffic.ahod_per_cons as ahod_per_cons,
	traffic.ahod_per_cons_rank as ahod_per_cons_rank,
	traffic.tti_val as tti_val,
	traffic.csi_val as csi_val,
	traffic.csi_rank as csi_rank

FROM traffic
	LEFT JOIN aff_inc on (traffic.region_id = aff_inc.regionid and aff_inc.year = SUBSTRING(traffic.year,1,4));
