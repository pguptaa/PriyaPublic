import pandas as pd
import numpy as np
import argparse

parser = argparse.ArgumentParser(description='Create Files')
parser.add_argument('input_file', type=str)
parser.add_argument('output_file', type=str)
args = parser.parse_args()
input = args.input_file
output = args.output_file

def file_process_traffic(file,file2):
    df = pd.read_excel(file)
    df = df.fillna(value='blank')
    df2 = df.ix[1:]
    return df2.to_csv(file2,header=None)

file_process_traffic(input,output)