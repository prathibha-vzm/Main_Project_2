import csv
import os
from robot.api.deco import keyword

# This Method Reads the Data from CSV file
def read_csv_file():
    #filename=r"C:\Users\91956\PycharmProjects\PythonMainProject\HR_project\data\test_data.csv"
    base_dir = os.path.dirname(__file__)
    filename = os.path.join(base_dir, "..", "data", "test_data.csv")

    with open(filename,'r',newline="")as csvfile:
        csv_reader=csv.DictReader(csvfile)
        return list(csv_reader)

# This Method Reads the Username and Password Fields in CSV
@keyword('Read Usernames and Passwords')
def read_usernames_passwords():
    credentials=[]
    file=read_csv_file()
    for row in file:
        credentials.append([row['Username'],row['Password']])
    return credentials

# This Method Reads Only the Valid Username in the CSV
@keyword('Read Valid Username')
def read_valid_username():
    file=read_csv_file()
    if file:
        credentials=file[0]
        valid_username=(credentials['Username'])
        print(valid_username)
    return valid_username

# This Method Reads Only the Valid Password in the CSV
@keyword('Read Valid Password')
def read_valid_password():
    file=read_csv_file()
    if file:
        credentials=file[0]
        valid_password=(credentials['Password'])
    return valid_password


# This is the main method to test the methods created in this file
if __name__=='__main__':
    read_valid_username()
