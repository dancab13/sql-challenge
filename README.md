# sql-challenge
Materials for the SQL Module 9 challenge for the BCS Data Analytics boot camp

<<<<<<< HEAD
This is a resubmission of the Module 9 challenge. This resubmission corrects the ERM, table schema, and queries by removing unnecessary IDs, which prevented the importing of CSVs.

Please note that I used the pgAdmin4 Import/Export function to import the CSVs. I included some command line code to import the CSVs, but PostgreSQL does not allow for relative paths. My code includes my absolute paths to the CSV files, but if using the command line code, you will have to change them to include your own absolute paths to the files.

Also please note that the Dept_Emp CSV file has a repeated value in the emp_no column. To fix this, I imported the table then added a new ID column with serial IDs and set that as the primary key for the table. The ERM does not include the primary key information for this table! I created two versions of the ERM: one that represents the CSV tables exactly and one that accounts for the new ID column (again, created after importing the CSV to the "Dept_Emp" table).

All code is my own. I referenced Stack Overflow and the web for confirming that PostgreSQL does not accept relative paths when importing CSVs.
=======
The materials for this challenge include three .sql files: 
-one with the table schema (and relevant other code, like DROP TABLE code)
-one with the queries
-one combined file that contains all of the code

Also included in the repo and below is an ERD created using QuickDBD. The diagram shows the relationships between the tables and notes primary and foreign keys of the tables.

The code is my own that I learned from class. I used the Xpert Learning Assistant for some sanity checks and minor help.

![QuickDBD-Module 9 SQL Challenge-IDs](https://github.com/dancab13/sql-challenge/assets/147662348/8fa13e92-3e9a-481f-9ba8-fd1dc964f3e7)
>>>>>>> refs/remotes/origin/main
