Instructions on the order to run files (starting with step1) and what these files do.
PLEASE NOTE: if you have postgres and Hadoop running on a UCB instance, then skip to Step2-mlp.sh.

ASSUMPTIONS: The bash commands included in this document are written with the assumption that the user
is working on the UCB AMI used for Exercise 1 and the bulk of the course labs.  The commands assume the
user has cloned our git repo to /home/w205.


0) Read the report on this project, which can be found here:

  /home/w205/Final_Project_MLP/Documentation/w205Final_Report.pdf



1) Step1-mlp.sh: 
  AS ROOT USER, run the Step1 file if you do no currently have a drive mounted on /data. This will take some time as this will set up postgres.

  $ sh /home/w205/Final_Project_MLP/Bash_Scripts/step1-mlp.sh



2) Step2-mlp.sh: 
  AS ROOT USER, run this script to update pip and install needed python packages: numpy, cython, pandas, xlrd. 

  $ sh /home/w205/Final_Project_MLP/Bash_Scripts/step2-mlp.sh



3) Step3-mlp.sh: 
  Will wget all of the data files from their origin urls on Census, Zillow, and Texas A&M sites respectively.
  In addition to getting the data files, this script will also utilize wget to download python scripts and DDL scripts the team created.

  SWITCH TO W205 USER:

  $ su - w205  


  AS W205 USER, run the following:

  $ sh /home/w205/Final_Project_MLP/Bash_Scripts/step3-mlp.sh


  (see additional notes below for further detail on the process happening in step 3)



4) Step4-mlp.sh: 
  Utilizes wget to import and then run the ETL files in hive.

  AS 205 USER, run the following:

  $ sh /home/w205/Final_Project_MLP/Bash_Scripts/step4-mlp.sh


  (see additional notes below for further detail on the process happening in step 3)



5) Explore the data via our Tableau application, found here:

https://public.tableau.com/profile/publish/205ProjWkbk_Mini/whereii#!/



==========================================================================================

NOTES ON STEP 3:
  Please see the complete list of data files and python files imported using wget below:

  Data File Name:
    complete-data.xlsx
    Affordability_Income_2016Q2.csv
    MSA_M2015_dl.xlsx
    CountyCrossWalk_Zillow.csv
    Metro_MedianRentalPrice_1Bedroom.csv
    Metro/Metro_MedianRentalPrice_2Bedroom.csv
    Metro_MedianRentalPrice_3Bedroom.csv
    Metro_MedianRentalPrice_4Bedroom.csv
    Metro_MedianRentalPrice_5BedroomOrMore.csv
    Metro_MedianRentalPrice_Studio.csv

  Python File Name: 
    zillow_process.py
    aff_clean.py
    traffic_clean_transform.py
    clean_census.py
    clean_mapping.py

  The traffic_clean_transform.py runs first against the traffic data set.
  Then the remaining .py files take inputs  to clean and transform the data.

  Here are the .py files and the commands passed to them:
    aff_clean.py -> "CountyCrossWalk_Zillow.csv" "income.csv" "mapping.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_1Bedroom.csv" "z1bedroom.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_2Bedroom.csv" "z2bedroom.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_3Bedroom.csv" "z3bedroom.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_4Bedroom.csv" "z4bedroom.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_5BedroomOrMore.csv" "z5bedroom.csv"
    zillow_process.py -> "Metro_MedianRentalPrice_Studio.csv" "zstudio.csv"

  Step 3 continued by making 10 sub directories in HDFS and placing the clean data files into their respective directories.
  Step 3 finishes by running the DDL scripts, which create and load tables in HDFS utilizing hive.
  DDL Scripts: 
    hive_traffic_aff.sql
    census_income_schema.sql
    mapping_schema.sql
    zillow_load.sql 


NOTES ON STEP 4:
Step4-mlp.sh: 
  Utilizes wget to import and then run the ETL files in hive.
  ETL Files: 
    mapping.sql -> mapping file that joins all other tables and normalized metro regions
    income.sql -> holds census income data
    traffic_income_ETL.sql -> holds traffic data
    Rental_pricing_ETL.sql -> partitioned table that holds rental pricing data for different house types.
  These ETL scripts create the final tables from the existing schema: rental_pricing, income , mapping, city_income_traffic.
  
This completes creating the tables. The next step is to retrieve these tables in a Tableau dashboard (which we already have set up).




               
