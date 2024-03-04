# GET DATA QUALITY REPORT FOR STAGING AREA

# Import Libraries
import os
import psycopg2
import pandas as pd
from tabulate import tabulate
from dotenv import load_dotenv

# Import the tests
import my_tests
from data_quality_checks import run_data_quality_check

# Load the environment variables
load_dotenv()

db_name = os.environ.get("DB_NAME")
db_user = os.environ.get("DB_USER")
db_password = os.environ.get("DB_PASSWORD")
db_host = os.environ.get("DB_HOST")
db_port = os.environ.get("DB_PORT")

# Connect to database
conn = psycopg2.connect(
		user = db_user,
	    password = db_password,
	    host = db_host,
	    port = db_port,
	    database = db_name)

print("Connected to data warehouse")

# Start of data quality checks
results = []
tests = {key:value for key,value in my_tests.__dict__.items() if key.startswith('test')}
for testname,test in tests.items():
    test['conn'] = conn
    results.append(run_data_quality_check(**test))

#print(results)
df=pd.DataFrame(results)
df.index+=1
df.columns = ['Test Name', 'Table','Column','Test Passed']
print(tabulate(df,headers='keys',tablefmt='psql'))

# End of data quality checks
conn.close()
print("Disconnected from data warehouse")
