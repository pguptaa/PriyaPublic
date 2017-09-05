DROP TABLE income;

CREATE TABLE IF NOT EXISTS income AS
SELECT
area as cbsa_code,
SUBSTRING(occ_code, 0, 2) as occ_category,
occ_code AS occ_code,
occ_title AS occ_title,
CASE WHEN tot_emp IN ("*", "**", "#", "##") THEN NULL ELSE CAST(tot_emp AS INT) END AS tot_emp,
CASE WHEN jobs_1000 IN ("*", "**", "#", "##") THEN NULL ELSE jobs_1000 END AS jobs_1000,
CASE WHEN h_mean IN ("*", "**", "#", "##") THEN NULL ELSE h_mean END AS h_mean,
CASE WHEN a_mean IN ("*", "**", "#", "##") THEN NULL ELSE a_mean END AS a_mean,
CASE WHEN mean_prse IN ("*", "**", "#", "##") THEN NULL ELSE mean_prse END AS mean_prse,
CASE WHEN h_pct10 IN ("*", "**", "#", "##") THEN NULL ELSE h_pct10 END AS h_pct10,
CASE WHEN h_pct25 IN ("*", "**", "#", "##") THEN NULL ELSE h_pct25 END AS h_pct25,
CASE WHEN h_median IN ("*", "**", "#", "##") THEN NULL ELSE h_median END AS h_median,
CASE WHEN h_pct75 IN ("*", "**", "#", "##") THEN NULL ELSE h_pct75 END AS h_pct75,
CASE WHEN h_pct90 IN ("*", "**", "#", "##") THEN NULL ELSE h_pct90 END AS h_pct90,
CASE WHEN a_pct10 IN ("*", "**", "#", "##") THEN NULL ELSE a_pct10 END AS a_pct10,
CASE WHEN a_pct25 IN ("*", "**", "#", "##") THEN NULL ELSE a_pct25 END AS a_pct25,
CASE WHEN a_median IN ("*", "**", "#", "##") THEN NULL ELSE a_median END AS a_median,
CASE WHEN a_pct75 IN ("*", "**", "#", "##") THEN NULL ELSE a_pct75 END AS a_pct75,
CASE WHEN a_pct90 IN ("*", "**", "#", "##") THEN NULL ELSE a_pct90 END AS a_pct90

FROM census_job_schema
WHERE occ_code <> "00-0000";
