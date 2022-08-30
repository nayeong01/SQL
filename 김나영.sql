SELECT *
FROM employee;

SELECT id,last_name
FROM employee;

SELECT id,last_name,salary
FROM employee;

SELECT id,last_name,salary
FROM employee
WHERE last_name = 'SMITH';

SELECT id,last_name,salary
FROM employee
WHERE salary = 52000;

SELECT id,last_name,salary
FROM employee
WHERE last_name <> 'SMITH';

SELECT id,last_name,salary
FROM employee
WHERE last_name !='SMITH';

SELECT id,last_name,salary
FROM employee
WHERE salary>35000;

SELECT id,last_name,salary
FROM employee
WHERE salary < 40000;

