import pandas as pd
import numpy as np
import argparse

# import pandas as pd
# import numpy as np
# import argparse

# parser = argparse.ArgumentParser(description='Create Files')
# parser.add_argument('input_file', type=str)
# parser.add_argument('output_file', type=str)
# args = parser.parse_args()
# input = args.input_file
# output = args.output_file

# def file_process_traffic(file,file2):
#     df = pd.read_excel(file)
#     df = df.fillna(value='blank')
#     df2 = df.ix[1:]
#     return df2.to_csv(file2,header=None)

# file_process_traffic(input,output)

# FIRST INPUT MUST BE ZILLOW FILE

parser = argparse.ArgumentParser(description='Create Mapping')
parser.add_argument('input_file1', type=str)
parser.add_argument('input_file2', type=str)
parser.add_argument('output_file', type=str)
args = parser.parse_args()
input1 = args.input_file1
input2 = args.input_file2
output = args.output_file


# Helper functions
def parse_CBSA(city_list):
    """parses CBSA city from longer string"""
    result = []
    for city in city_list:
        comma = city.find(',')
        dash = city.find('-')
        if dash == -1 or dash > comma:
            result.append(city[:comma])
        else:
            result.append(city[:dash])
    return result


def parse_state(city_list):
    """parses state from longer string"""
    result = []
    for city in city_list:
        result.append(city[city.find(',')+2:city.find(',')+4])
    return result


def fixer(census, zillow):
    """compares census & zillow cities to
    re-map CBSA codes"""
    result = []
    for city in census:
        for loc in zillow:
            if city[1]==loc[2]:
                result.append(loc)
            elif city[0] in loc[0] and city[3]==loc[3]:
                result.append([loc[0], loc[1], city[1], city[3]])
            else:
                continue
    return result


def clean_mapping(infile1, infile2, outfile):
    z_map = pd.read_csv(infile1, usecols=["MetroName_Zillow", "MetroRegionID_Zillow", "CBSAName", "CBSACode"])
    my_z = z_map.drop_duplicates()
    my_z2 = my_z[my_z.MetroName_Zillow.notnull()]
    census = pd.read_csv(infile2, header=None, usecols=[1,2,3])
    my_c = census.rename(columns={2:"CBSA", 1:"State", 3:"CBSARegion"}).drop_duplicates()
    my_c["ParsedCity"] = parse_CBSA(my_c.CBSARegion)
    my_z2["State"] = parse_state(my_z2.MetroName_Zillow)
    z_master = my_z2[["MetroName_Zillow", "MetroRegionID_Zillow", "CBSACode", "State"]].values.tolist()
    c_master = my_c[["ParsedCity", "CBSA", "CBSARegion", "State"]].values.tolist()
    mapping = pd.DataFrame(fixer(c_master, z_master)).rename(columns={0:"MetroName_Zillow", 1:"MetroRegionID_Zillow", 2:"CBSA", 3: "State"})
    return mapping.to_csv(outfile, header=False, index=False, index_label=False)

clean_mapping(input1, input2, output)