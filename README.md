# Data Warehousing with Star Schema

This repository demonstrates the process of creating a staging area, checking possible issues in the temporary tables, modeling data based on the star schema, and loading checked data into the permanent tables. The repository also showcases the use of advanced SQL `GROUP BY` variations (`GROUPING SETS`, `ROLLUP`, and `CUBE`), as well as a `Materialized View` for the purposes of data analysis.

## Project Structure

- `01_create_tables_staging_area.sql`: SQL script to create the temporary tables in the staging area.
- `02_insert_data.sql`: SQL script to insert sample data into the temporary tables.
- `03_data_quality_report.py`: Run this Python script to check the data quality in the temporary tables. The statuses from "Test Passed" should return TRUE. This Python script requires the other 2 Python scripts `data_quality_checks.py` and `my_tests.py`.
- `04_create_tables_data_warehouse.sql`: SQL script to create the permanent tables.
- `05_load_from_staging.sql`: SQL script to load data from staging area into the permanent tables.
- `06_grouping_sets_query.sql`: SQL script to create a Function that uses `GROUPING SETS` for data analysis.
- `07_rollup_query.sql`: SQL script to create a Function that uses `ROLLUP` for data analysis.
- `08_cube_query.sql`: SQL script to create a Function that uses `CUBE` for data analysis.
- `09_materialized_view.sql`: SQL script to create a `Materialized View`, also for data analysis.

## How to Run

1. Set up your Postgre database and create `.env` file with your Postgre database configuration (check `.env.example` for the structure).
2. Run the scripts in the order of their numbering.
3. You can delete the temporary tables if you want. I decided to include them here so you can check everything after you run all the scripts. The temporary tables always start with "Staging_".

## Data Model

The data warehouse example uses a star schema model, with `FactTrips` as the fact table and `DimDate`, `DimStation`, and `DimTruck` as dimension tables.