
# coding: utf-8

# In[1]:

import pandas as pd
import numpy as np
import difflib as dl


#Zillow file

#Read in Zillow Data, this will be our standard for Region ID
z = pd.read_csv('Affordability_Income_2016Q2.csv')
z = pd.melt(z, id_vars=['RegionName','RegionID','SizeRank'],var_name=["year"])

#Making a list of Zillow Region IDs
region_id = list(set(list(z['RegionID'])))
#Making a list of Zillow Regions
region_list = list(set(list(z['RegionName'])))


#Traffic data
t = pd.read_excel('complete-data.xlsx')
t = t.fillna(value='blank')
t = t.ix[4:]

#Converting to ascii
t['Urban Area'] = t['Urban Area'].apply(lambda x: x.decode('unicode_escape').                                          encode('ascii', 'ignore').                                          strip())

#Creating list out of the urban areas in the traffic data
region_list_2 = list(t['Urban Area'])


#Function compares traffic data to zillow data and changes format of the region names so it matches the zillow data
def fuzz_lists(a,b):
    for i in range(len(a)):
        for j in range(len(b)):
            fuzz = dl.SequenceMatcher(None,a[i],b[j]).ratio()
            if fuzz > 0.70:
                b[j] = a[i]
#Return lists
fuzz_lists(region_list, region_list_2)

#creating a master dictionary so we can add RegionID to the traffic data 
master_reg_name = list(z['RegionName'])
master_reg_id = list(z['RegionID'])

reg_dict = dict(zip(master_reg_name, master_reg_id))

#Now it's time to start matching it up!
mini_reg_id = []
for region in region_list_2:
    if region in reg_dict:
        mini_reg_id.append(str(reg_dict[region]))
    else:
        mini_reg_id.append(None)

#Creating another column in the traffic data that will be the region ID!!
t['RegionID'] = pd.DataFrame(mini_reg_id)

tt = t.ix[2:]

tt.to_csv('traffic.csv',header=None, index=None)

