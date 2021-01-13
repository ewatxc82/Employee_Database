--Data Analysis 1: List the employee number, last name, first name, sex, and salary.
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		e.sex as "Sex",
		s.salary as "Salary"
FROM Employees e
JOIN Salaries s
ON (e.emp_no = s.emp_no);

----Data Analysis 2: List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		e.hire_date as "Hire Date"
FROM Employees e
WHERE e.hire_date > '1985-12-31' AND e.hire_date <'1987-01-01'
ORDER BY e.hire_date;

--Data Analysis 3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT d.dept_no as "Department Number",
		d.dept_name as "Department Name",
		m.emp_no as "Manager Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		m.from_date as "Manager Start Date",
		m.to_date as "Manager End Date"
FROM Dept_Manager m
JOIN Departments d ON (d.dept_no = m.dept_manager)
JOIN Employees e ON (m.emp_no = e.emp_no);

--Data Analysis 4: List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM Dept_Emp a
JOIN Departments d on (a.dept_no = d.dept_no)
JOIN Employees e on (e.emp_no = a.emp_no);

--Data Analysis 5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.last_name as "Last Name",
		e.first_name as "First Name",
		e.sex as "Employee Number"
FROM Employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Data Analysis 6: List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM Dept_Emp a
JOIN Departments d on (a.dept_no = d.dept_no)
JOIN employees e on (e.emp_no = a.emp_no)
WHERE d.dept_name = 'Sales';

--Data Analysis 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM Dept_Emp a
JOIN Departments d on (a.dept_no = d.dept_no)
JOIN Employees e on (e.emp_no = a.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--Data Analysis 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "Last Name", count(last_name) as "Frequency Count"
FROM Employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;