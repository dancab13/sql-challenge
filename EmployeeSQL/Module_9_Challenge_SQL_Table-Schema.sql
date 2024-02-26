-- Module 9 Challenge table schema

-- Drop tables if necessary

DROP TABLE "Departments",
"Titles",
"Employees",
"Dept_Emp",
"Dept_Manager",
"Salaries"

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4iBjPa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Departments" (
    "id" SERIAL   NOT NULL,
    "dept_no" VARCHAR(25)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "id" SERIAL   NOT NULL,
    "title_id" VARCHAR(25)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "id" SERIAL   NOT NULL,
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
    "id" SERIAL   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Dept_Manager" (
    "id" SERIAL   NOT NULL,
    "dept_no" VARCHAR(25)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Salaries" (
    "id" SERIAL   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "id"
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

-- Check that the tables imported correctly

SELECT * FROM "Departments"

SELECT * FROM "Titles"

SELECT * FROM "Employees"

SELECT * FROM "Dept_Emp"

SELECT * FROM "Dept_Manager"

SELECT * FROM "Salaries"