-- Module 9 SQL Challenge Table Schema

-- Drop views, tables, and database if necessary

DROP VIEW dept_managers,
dept_employees,
employee_departments;

DROP TABLE "Departments",
"Titles",
"Employees",
"Dept_Emp",
"Dept_Manager",
"Salaries";

DROP DATABASE sql_challenge;

-- Create database if necessary

CREATE DATABASE sql_challenge

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4iBjPa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(25)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(25)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR(25)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(25)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- Import the CSVs for each table using pgAdmin4's Import/Export function. 
-- See https://www.postgresqltutorial.com/postgresql-tutorial/import-csv-file-into-posgresql-table/ for more information.
-- (There are no id columns to uncheck.)

-- Uncomment the below to import the CSVs using the absolute path.
-- NOTE: You must change the FROM path to reflect your absolute path to where the CSV files live.
-- NOTE: The below FROM paths are my absolute paths but will differ for you.

-- COPY "Departments"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/departments.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- COPY "Titles"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/titles.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- COPY "Employees"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/employees.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- COPY "Dept_Emp"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/dept_emp.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- COPY "Dept_Manager"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/dept_manager.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- COPY "Salaries"
-- FROM /Users/Dan/Desktop/Data Bootcamp/sql-challenge/Starter_Code/data/salaries.csv
-- DELIMITER ',' 
-- CSV HEADER;

-- Check that the tables imported correctly

SELECT * FROM "Departments"

SELECT * FROM "Titles"

SELECT * FROM "Employees"

SELECT * FROM "Dept_Emp"

SELECT * FROM "Dept_Manager"

SELECT * FROM "Salaries"

-- The table "Dept_Emp" has a repeated value at line 11, with the emp_no 10010 repeated from line 10.
-- This leads to the table not having a primary key.
-- To add a primary key, add a serial id column.

ALTER TABLE "Dept_Emp" ADD COLUMN id SERIAL PRIMARY KEY;