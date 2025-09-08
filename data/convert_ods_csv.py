import pandas as pd

def convert_ods_to_csv(ods_file, csv_file, sheet=0):
    df = pd.read_excel(ods_file, engine="odf", sheet_name=sheet)
    df.to_csv(csv_file, index=False)

if __name__=="__main__":
    convert_ods_to_csv("test_data.ods", "test_data.csv")
