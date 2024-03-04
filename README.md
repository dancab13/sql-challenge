# sql-challenge
Materials for the SQL Module 9 challenge for the BCS Data Analytics boot camp

This is a resubmission of the Module 9 challenge. This resubmission corrects the ERM, table schema, and queries by removing unnecessary IDs, which prevented the importing of CSVs.

Please note that I used the pgAdmin4 Import/Export function to import the CSVs. I included some command line code to import the CSVs, but PostgreSQL does not allow for relative paths. My code includes my absolute paths to the CSV files, but if using the command line code, you will have to change them to include your own absolute paths to the files.

Also please note that the Dept_Emp CSV file has a repeated value in the emp_no column. To fix this, I imported the table then added a new ID column with serial IDs and set that as the primary key for the table. The ERM does not include the primary key information for this table! I created two versions of the ERM: one that represents the CSV tables exactly and one that accounts for the new ID column (again, created after importing the CSV to the "Dept_Emp" table).

All code is my own. I referenced Stack Overflow and the web for confirming that PostgreSQL does not accept relative paths when importing CSVs.