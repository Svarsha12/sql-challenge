---List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e LEFT JOIN salaries s ON e.emp_no = s.emp_no;

---List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM employees 
WHERE extract(YEAR FROM hire_date) = 1986;



---List the manager of each department along with their department number, 
---department name, employee number, last name, and first name.

SELECT  a.dept_no,d.dept_name, e.emp_no, t. title, e.last_name, e.first_name
FROM employees e JOIN dept_manager a ON e.emp_no = a.emp_no
JOIN departments d
ON d.dept_no = a.dept_no
JOIN titles t
ON e.emp_title_id = t. title_id;

----List the department number for each employee along with that employee’s employee number, 
---last name, first name, and department name.

SELECT  n.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e JOIN dept_emp n ON e.emp_no = n.emp_no
JOIN departments d
ON d.dept_no = n.dept_no;

---List first name, last name, 
--and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

---List each employee in the Sales department, including their employee number, last name, and first name.

SELECT  n.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e JOIN dept_emp n ON e.emp_no = n.emp_no
JOIN departments d
ON d.dept_no = n.dept_no
WHERE dept_name = 'Sales';

---List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name

SELECT  n.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e JOIN dept_emp n ON e.emp_no = n.emp_no
JOIN departments d
ON d.dept_no = n.dept_no
WHERE dept_name IN ('Sales', 'Development');

---List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).

SELECT employees.last_name, COUNT(employees.last_name) AS "Frequency Count"
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC;