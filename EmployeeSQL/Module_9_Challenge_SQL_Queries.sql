-- Module 9 Challenge queries

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

CREATE VIEW dept_managers AS
SELECT dm.dept_no, dep.dept_name, dm.emp_no
FROM "Dept_Manager" as dm
LEFT JOIN "Departments" as dep
ON dm.dept_no = dep.dept_no;

SELECT dms.dept_no, dms.dept_name, dms.emp_no, emp.last_name, emp.first_name
FROM dept_managers AS dms
LEFT JOIN "Employees" AS emp
ON dms.emp_no = emp.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW dept_employees AS
SELECT de.dept_no, dep.dept_name, de.emp_no
FROM "Dept_Emp" as de
LEFT JOIN "Departments" as dep
ON de.dept_no = dep.dept_no;

SELECT emp.id, demps.dept_no, emp.emp_no, emp.last_name, emp.first_name, demps.dept_name
FROM dept_employees AS demps
RIGHT JOIN "Employees" AS emp
ON demps.emp_no = emp.emp_no
ORDER BY emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT id, first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.
-- Use the table from the question before the previous one and create a view to answer this and the next question.
CREATE VIEW employee_departments AS
SELECT emp.id, demps.dept_no, emp.emp_no, emp.last_name, emp.first_name, demps.dept_name
FROM dept_employees AS demps
RIGHT JOIN "Employees" AS emp
ON demps.emp_no = emp.emp_no
ORDER BY emp_no;

SELECT id, emp_no, last_name, first_name, dept_name
FROM employee_departments
WHERE dept_name = 'Sales'
ORDER BY emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT id, emp_no, last_name, first_name, dept_name
FROM employee_departments
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT DESC