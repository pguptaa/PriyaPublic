import numpy as np
import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='Create Files')
parser.add_argument('input_file', type=str)
parser.add_argument('output_file', type=str)
args = parser.parse_args()
input = args.input_file
output = args.output_file

def file_process(file,file2):   
    t = pd.read_csv(file)
    t = pd.melt(t, id_vars=['RegionName','SizeRank'],var_name=["year"])
    return t.to_csv(file2, index=False,header=False)

file_process(input,output)
    