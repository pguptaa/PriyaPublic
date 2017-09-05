
# coding: utf-8

# In[23]:

import pandas as pd
import numpy as np
import difflib as dl


# In[72]:

#Zillow Data
g = pd.read_csv("Affordability_Income_2016Q2.csv")
g = pd.melt(g, id_vars=['RegionName','RegionID','SizeRank'],var_name=["year"])


# In[74]:

#Making a list of Zillow Regions
region_list = list(set(list(g['RegionName'])))
len(region_list)


# In[75]:

#Traffic data
h = pd.read_excel("complete-data.xlsx")
h = h.fillna(value='blank')
h = h.ix[4:]


# In[76]:

#Making list of traffic data regions
region_list_2 = list(set(list(h['Urban Area'])))
len(region_list_2)


# In[9]:

m = pd.read_excel("MSA_M2015_dl.xlsx")


# In[77]:

region_list_3 = list(set(list(m['AREA_NAME'])))
len(region_list_3)


# In[78]:

def fuzz_lists(a,b):
    for i in range(len(a)):
        for j in range(len(b)):
            fuzz = dl.SequenceMatcher(None,a[i],b[j]).ratio()
            if fuzz > 0.70:
                b[j] = a[i]
    return sorted(a), sorted(b)


# In[81]:

# fuzz_lists(region_list, region_list_2)
# fuzz_lists(region_list, region_list_3)


# In[114]:

overlapping_list = []
for word in region_list:
    if word in region_list_3:
        overlapping_list.append(word)
    if word in region_list_2:
        overlapping_list.append(word)
overlapping_list = list(set(overlapping_list))
len(combined_list)
#sorted(overlapping_list)

