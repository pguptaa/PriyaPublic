#! /bin/sh
#as w205 user

cd /home/w205/data_files

# Melanie's files
wget https://www.dropbox.com/s/1xqs2ffv1toarfe/mapping.sql -O /home/w205/data_files/mapping.sql
wget https://www.dropbox.com/s/hmaph4z9tfdqoc1/income.sql -O /home/w205/data_files/income.sql


# Melanie's ETL
hive -f /home/w205/data_files/mapping.sql
hive -f /home/w205/data_files/income.sql

# Lisa's files

wget https://www.dropbox.com/s/rnogvyh6qxay2px/traffic_income_ETL.sql

#Lisa's ETL
hive -f /home/w205/data_files/traffic_income_ETL.sql

# Priya's file

wget https://www.dropbox.com/s/kwqyscj0ogqu6zv/Rental_pricing_ETL.sql /home/w205/data_files/Rental_pricing_ETL.sql

# Priya's ETL
hive -f /home/w205/data_files/Rental_pricing_ETL.sql
