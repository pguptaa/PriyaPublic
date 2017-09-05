DROP TABLE mapping;

CREATE TABLE IF NOT EXISTS mapping AS SELECT

SUBSTRING(metro_region_id_zillow, 1, LENGTH(metro_region_id_zillow)-2) AS metro_id,
metro_name_zillow AS metro_name,
state AS state,
SUBSTRING(cbsa_code, 1, LENGTH(cbsa_code)-2) AS cbsa_code,

CASE WHEN state IN ("AK", "HI", "WA", "OR", "CA")
THEN "West"
WHEN state IN ("MT", "ID", "WY", "NV", "UT", "CO")
THEN "Mountain West"
WHEN state in ("AZ", "NM", "TX", "OK")
THEN "Southwest"
WHEN state in ("ND", "SD", "NE", "KS", "MN", "IA", "MO", "WI", "IL", "IN", "MI", "OH")
THEN "Midwest"
WHEN state in ("PA", "NY", "NJ", "VT", "NH", "MA", "MD", "ME", "CT", "RI", "DC", "DE")
THEN "Northeast"
WHEN state in ("VA", "WV", "KY", "NC", "TN", "AR", "LA", "MS", "AL", "GA", "FL", "SC")
THEN "Southeast"
ELSE "Other" END AS region 

FROM mapping_schema
;



