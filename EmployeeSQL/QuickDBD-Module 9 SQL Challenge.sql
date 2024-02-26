-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4iBjPa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE "Departments",
"Titles",
"Employees",
"Dept_Emp",
"Dept_Manager",
"Salaries"

CREATE TABLE "Departments" (
	"id" SERIAL PRIMARY KEY
    "dept_no" VARCHAR(25)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Titles" (
	"id" SERIAL PRIMARY KEY
    "title_id" VARCHAR(25)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Employees" (
	"id" SERIAL PRIMARY KEY,
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR(25)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "id" SERIAL PRIMARY KEY,
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(25)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "id" SERIAL PRIMARY KEY,
    "dept_no" VARCHAR(25)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Salaries" (
    "id" SERIAL PRIMARY KEY,
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL
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

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT sal.id, emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" as emp 
INNER JOIN "Salaries" as sal
ON emp.emp_no = sal.emp_no
ORDER BY emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM "Employees" as emp 
WHERE hire_date BETWEEN '1/1/86' AND '12/31/86'
ORDER BY hire_date, last_name;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d 
FROM "Employees"
WHERE emp_no IN (
	SELECT emp_no
	FROM "Dept_Manager"
	WHERE title_id = 
)

CREATE VIEW dept_managers AS
SELECT dm.dept_no, dep.dept_name, dm.emp_no
FROM "Dept_Manager" as dm
LEFT JOIN "Departments" as dep
ON dm.dept_no = dep.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

-- List each employee in the Sales department, including their employee number, last name, and first name.

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).