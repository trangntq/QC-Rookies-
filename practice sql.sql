---Ex1--
SELECT last_name, hire_date, department_id
FROM employees
WHERE department_id in ( SELECT department_id FROM employees WHERE last_name = 'Zlotkey')
and last_name <> 'Zlotkey';
----Ex2---
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > ( SELECT avg(salary) FROM employees)
ORDER BY salary ASC; 
----Ex3----
SELECT employee_id, last_name
FROM employees
WHERE department_id in (SELECT department_id FROM employees WHERE last_name LIKE '%u%');
----Ex4----
SELECT e.last_name, e.department_id, e.job_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE location_id = '1700';
---Ex5---
--cach 1--
SELECT last_name, salary FROM employees WHERE manager_id in 
(SELECT employee_id FROM employees WHERE last_name = 'King');
--cach 2--
SELECT e.last_name, e.salary 
FROM employees e
JOIN employees manager 
ON e.manager_id = manager.employee_id
WHERE manager.last_name ='King';
----Ex6----
SELECT department_id, last_name, job_id
FROM employees 
WHERE department_id in (SELECT department_id FROM departments WHERE department_name = 'Executive')
----Ex7----
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id in (SELECT department_id FROM employees WHERE last_name LIKE '%u%')
and salary > (SELECT avg(salary) FROM employees);
----Ex8----
SELECT max(salary) as 'Maximum', min(salary) as 'Minimum', Sum(salary) as 'Sum', ROUND(avg(salary),0) as 'Average'
FROM employees;
----Ex9----
SELECT UPPER(LEFT(last_name,1))+LOWER(SUBSTRING(last_name,2,len(last_name))) "Last Name", len(last_name) "Length of Name"
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;
----Ex10----
SELECT employee_id, last_name, salary, ROUND(salary*1.155,0) as 'New Salary'
FROM employees;
----Ex11----
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;
----Ex12----
SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees manager 
ON e.manager_id = manager.employee_id
WHERE e.hire_date > manager.hire_date
and e.department_id in (SELECT department_id from departments
WHERE location_id in (SELECT location_id FROM locations WHERE city = 'Toronto'));

