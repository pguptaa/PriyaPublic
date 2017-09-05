#! /bin/sh
#as w205 user
mkdir /home/w205/data_files/
cd /home/w205/data_files/
#Lisa's Files
wget -P /home/w205/data_files/ https://dl.dropboxusercontent.com/u/3865957/complete-data.xlsx
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Affordability_Income_2016Q2.csv
wget -P /home/w205/data_files/ https://dl.dropboxusercontent.com/u/3865957/aff_clean.py
wget -P /home/w205/data_files/ https://dl.dropboxusercontent.com/u/3865957/traffic_clean_transform.py
#Melanie's Files
wget -P /home/w205/data_files/ https://www.dropbox.com/s/6pwtama90zwp5yb/clean_census.py?dl=0 -O /home/w205/data_files/clean_census.py
wget -P /home/w205/data_files/ https://www.dropbox.com/s/qq1uuca538c0ivl/clean_mapping.py?dl=0 -O /home/w205/data_files/clean_mapping.py
wget -P /home/w205/data_files/ https://www.dropbox.com/s/vzkxq4rz6cq45lm/MSA_M2015_dl.xlsx?dl=0
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/CountyCrossWalk_Zillow.csv
#Priya's Files
wget https://www.dropbox.com/s/1livlx3cmp829do/zillow_process.py?dl=0 -O /home/w205/data_files/zillow_process.py
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_1Bedroom.csv
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_2Bedroom.csv
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_3Bedroom.csv
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_4Bedroom.csv
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_5BedroomOrMore.csv
wget -P /home/w205/data_files/ http://files.zillowstatic.com/research/public/Metro/Metro_MedianRentalPrice_Studio.csv
#Lisa's Cleaning Files
python2.7 /home/w205/data_files/traffic_clean_transform.py
python2.7 /home/w205/data_files/aff_clean.py Affordability_Income_2016Q2.csv aff_inc.csv
#Melanie's Cleaning Files
python2.7 /home/w205/data_files/clean_census.py "MSA_M2015_dl.xlsx?dl=0" "income.csv"
python2.7 /home/w205/data_files/clean_mapping.py "CountyCrossWalk_Zillow.csv" "income.csv" "mapping.csv"
# tail -n +2 /home/w205/data_files/CountyCrossWalk_Zillow.csv > /home/w205/data_files/mapping.csv
#Priya's Cleaning Files
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_1Bedroom.csv" "z1bedroom.csv"
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_2Bedroom.csv" "z2bedroom.csv"
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_3Bedroom.csv" "z3bedroom.csv"
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_4Bedroom.csv" "z4bedroom.csv"
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_5BedroomOrMore.csv" "z5bedroom.csv"
python2.7 /home/w205/data_files/zillow_process.py "Metro_MedianRentalPrice_Studio.csv" "zstudio.csv"
#Lisa's HDFS
hdfs dfs -mkdir -p /user/w205/data_files/traffic
hdfs dfs -put traffic.csv /user/w205/data_files/traffic
hdfs dfs -mkdir -p /user/w205/data_files/aff_inc
hdfs dfs -put aff_inc.csv /user/w205/data_files/aff_inc
#Melanie's HDFS
hdfs dfs -mkdir -p /user/w205/data_files/census_income
hdfs dfs -mkdir -p /user/w205/data_files/metro_mapping
hdfs dfs -put income.csv /user/w205/data_files/census_income/income.csv
hdfs dfs -put mapping.csv /user/w205/data_files/metro_mapping/mapping.csv
#Priya's HDFS
hdfs dfs -mkdir -p /user/w205/data_files/1bed
hdfs dfs -mkdir -p /user/w205/data_files/2bed
hdfs dfs -mkdir -p /user/w205/data_files/3bed
hdfs dfs -mkdir -p /user/w205/data_files/4bed
hdfs dfs -mkdir -p /user/w205/data_files/5bed
hdfs dfs -mkdir -p /user/w205/data_files/studio
hdfs dfs -put z1bedroom.csv /user/w205/data_files/1bed/z1bedroom.csv
hdfs dfs -put z2bedroom.csv /user/w205/data_files/2bed/z2bedroom.csv
hdfs dfs -put z3bedroom.csv /user/w205/data_files/3bed/z3bedroom.csv
hdfs dfs -put z4bedroom.csv /user/w205/data_files/4bed/z4bedroom.csv
hdfs dfs -put z5bedroom.csv /user/w205/data_files/5bed/z5bedroom.csv
hdfs dfs -put zstudio.csv /user/w205/data_files/studio/zstudio.csv
#Lisa DDL File
wget -P /home/w205/data_files https://www.dropbox.com/s/kud8vfqyw0mfqqz/hive_traffic_aff.sql
hive -f /home/w205/data_files/hive_traffic_aff.sql
#Melanie DDL File - new ones
wget -P /home/w205/data_files/ https://www.dropbox.com/s/xn1089ahzym23it/mapping_schema.sql
wget -P /home/w205/data_files/ https://www.dropbox.com/s/1y64rjowz85w60y/census_income_schema.sql

hive -f /home/w205/data_files/census_income_schema.sql
hive -f /home/w205/data_files/mapping_schema.sql
#Priya's DDL File
wget https://www.dropbox.com/s/183m4gw77bboxdb/zillow_load.sql?dl=0 -O /home/w205/data_files/zillow_load.sql
hive -f /home/w205/data_files/zillow_load.sql
