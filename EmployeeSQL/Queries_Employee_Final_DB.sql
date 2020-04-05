-- 	DATA ANALYSIS
-- 	Excercise #1: List the following details of each employee: employee number,
--	last name, first name, gender, and salary

-- Query to display the above relationships between Employees and Salaries table schemas
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
FROM Employees
-- The join statement between Employees and Salaries (emp_no)
JOIN Salaries
ON Employees.emp_no = Salaries.emp_no
ORDER BY
	Employees.emp_no;	-- sorting the data

-- 	Excercise #2: List employees who were hired in 1986

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.hire_date
FROM Employees
WHERE Employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY Employees.hire_date; -- sorting the data

-- 	Excercise #3: List the manager of each department with the following information: department number, 
-- 	department name, the manager's employee number, last name, first name, and start and end employment dates.

-- 	This query shows the relationahip between Departments & Dept_Manager (dept_no) and
-- 	Employees and Dept_Employees (emp_no)

SELECT Departments.dept_no, Departments.dept_name, Dept_Manager.emp_no, Dept_Manager.from_date, Dept_Manager.to_date, Employees.last_name, Employees.first_name
FROM Departments
JOIN Dept_Manager
ON Dept_Manager.dept_no = Departments.dept_no
JOIN Employees
ON Employees.emp_no = Dept_Manager.emp_no
ORDER BY Departments.dept_no; -- sorting the data

--	Excercise #4: List the department of each employee with the following information: employee number, 
--	last name, first name, and department name.

-- 	The query display relationship between Employees, Dept_Employees and Departments

SELECT Dept_Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Employees
JOIN Departments
ON Departments.dept_no = Dept_Employees.dept_no
JOIN Employees
ON Employees.emp_no = Dept_Employees.emp_no
ORDER BY Dept_Employees.emp_no; -- sorting the data

-- Excercise#5: List all employees whose first name is "Hercules" and last names begin with "B."

-- Displaying the query for the Employees with the above details

SELECT Employees.last_name, Employees.first_name
FROM Employees
WHERE Employees.first_name = 'Hercules'
AND Employees.last_name LIKE 'B%'
ORDER BY Employees.last_name; -- sorting the data

-- 	Excercise #6: List all employees in the Sales department, including their employee number, 
--	last name, first name, and department name.

-- 	Displaying the query with the above details stating relationship between Employees, 
-- 	Dept_Employees and Departments

SELECT Dept_Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Employees
JOIN Departments
ON Departments.dept_no = Dept_Employees.dept_no
JOIN Employees
ON Employees.emp_no = Dept_Employees.emp_no
WHERE Departments.dept_name = 'Sales'  -- on the Sales Department
ORDER BY Dept_Employees.emp_no; -- sorting the data

-- Excercise #7: List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

-- Same procedure as Excercise #6, including the Development department

SELECT Dept_Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Dept_Employees
JOIN Departments
ON Departments.dept_no = Dept_Employees.dept_no
JOIN Employees
ON Employees.emp_no = Dept_Employees.emp_no
WHERE Departments.dept_name = 'Sales'  -- including Sales and Development department
OR Departments.dept_name = 'Development'
ORDER BY Dept_Employees.emp_no;

--	Excercise #8: In descending order, list the frequency count of employee last names, 
-- 	i.e., how many employees share each last name

-- This query counts and groups the employees that share last names

SELECT Employees.last_name, COUNT (Employees.last_name) AS "Frequency"
FROM Employees
GROUP BY Employees.last_name
ORDER BY "Frequency" DESC;
