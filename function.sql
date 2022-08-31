SELECT e.id,
e.last_name,
d.department_name,
o.address,
s.company,
s.meeting_date
FROM employee e
INNER JOIN office o ON e.office_id = o.id
INNER JOIN sales_meeting s ON e.id = s.employee_id
INNER JOIN department d ON e.department_id = d.id;

ALTER TABLE employee
ADD CONSTRAINT depart_id FOREIGN KEY (department_id) REFERENCES employee(id);

ALTER TABLE department
ADD CONSTRAINT dpm_id FOREIGN KEY(id) REFERENCES employee(id);

ALTER TABLE department
ADD CONSTRAINT dpm_id PRIMARY KEY(id);

ALTER TABLE employee
ADD CONSTRAINT depart_id FOREIGN KEY(department_id) REFERENCES department(id);

SELECT e.id AS employee_id,
e.last_name,
e.salary,
e.job_title,
d.department_name,
o.address,
s.company,
s.meeting_date
FROM employee e
INNER JOIN office o ON e.office_id = o.id
INNER JOIN sales_meeting s ON e.id = s.employee_id
INNER JOIN department d ON e.department_id = d.id
WHERE o.address LIKE '%Main Street%'
AND e.salary > 30000;

SELECT id,
last_name,
salary,
salary*1.1 AS salary_inc_comm,
salary*2 AS salary_double
FROM employee;

SELECT id,
last_name,
salary,
salary/2
FROM employee;

SELECT 123 FROM dual;
SELECT 123 FROM employee;

SELECT ROUND(123.456,0) FROM dual;

SELECT ROUND(123.456,2) FROM dual;

SELECT CEIL(123.456) AS num_ceiling,
FLOOR(123.456) AS num_floor
FROM dual;

SELECT id,
last_name,
salary,
FLOOR(salary/12) AS monthly_salary,
MOD(salary,12) AS monthly_remaining
FROM employee;


SELECT 'John'||'Smith'
FROM dual;

SELECT 'John'||'Smith' AS full_name
FROM dual;

SELECT id,
last_name||salary
FROM employee;

SELECT id,
address,
UPPER(address)
FROM office;

INSERT INTO employee (id, last_name, salary, office_id)
VALUES(10, 'Jones',42000,2);

SELECT id,
last_name,
salary,
office_id
FROM employee;

SELECT id, last_name, salary, office_id
FROM employee
WHERE UPPER(last_name) = 'JONES';

SELECT id, address, SUBSTR(address,1,2)
FROM office;

SELECT id, meeting_date, meeting_date + 7
FROM sales_meeting;

SELECT id, meeting_date, meeting_date+14,meeting_date - 30
FROM sales_meeting;

SELECT id,
meeting_date,
TO_CHAR(meeting_date,'DD/MON/YYYY HH:MI:AM') AS meeting_datetime
FROM sales_meeting;

SELECT id,
TO_CHAR(meeting_date,'DD/MON/YYYY HH:MI:SS AM') AS meeting_datetime,
TO_CHAR(meeting_date + 6/24, 'DD/MON/YYYY HH:MI:SS AM') AS meeting_datetime_future
FROM sales_meeting;

SELECT 
TO_CHAR(SYSDATE, 'DD/MM/YY HH:MI:SS AM') AS time_now
FROM dual;

INSERT INTO sales_meeting(id,employee_id,company,meeting_date)
VALUES(4,7,'McMahon',SYSDATE);

SELECT
meeting_date,
ADD_MONTHS(meeting_date, 6) AS new_date
FROM sales_meeting;

SELECT
meeting_date,
ADD_MONTHS(meeting_date, 24) AS new_date,
ADD_MONTHS(meeting_date,2*12) AS new_date_ex2
FROM sales_meeting;

SELECT last_name,
CASE last_name
WHEN 'JONES' THEN 'The name is Jones'
WHEN 'SMITH' THEN 'The name is Smith'
WHEN 'KING' THEN 'The name is King'
ELSE 'The name is something else'
END namecheck
FROM employee;

SELECT id,
last_name,
salary,
CASE salary
WHEN 20000 THEN 'Eligible'
WHEN 40000 THEN 'Eligible'
ELSE 'Not Eligible'
END salary_check
FROM employee;

SELECT
last_name,
CASE UPPER(last_name)
WHEN 'JONES' THEN 'The name is Jones'
WHEN 'SMITH' THEN 'The name is Smith'
WHEN 'KING' THEN 'The name is King'
ELSE 'The name is something else'
END namecheck
FROM employee;

SELECT
last_name,
salary,
CASE salary
WHEN 20000 THEN 'Eligible'
WHEN 40000 THEN 'Eligible'
ELSE 'Not Eligible'
END salary_check
FROM employee;

SELECT
last_name,
CASE
WHEN UPPER(last_name) = 'JONES' THEN 'The name is Jones'
WHEN UPPER(last_name) = 'SMITH' THEN 'The name is Smith'
WHEN UPPER(last_name) = 'KING' THEN 'The name is King'
ELSE 'The name is something else'
END namecheck
FROM employee;

SELECT id,
last_name,
salary,
CASE
WHEN salary < 40000 THEN 'Low salary'
WHEN salary > 40000 AND salary < 50000 THEN 'Medium salary'
WHEN salary > 50000 THEN 'High salary'
END salary_check
FROM employee;

SELECT id,
last_name,
salary,
CASE
WHEN salary < 40000 THEN 'Low salary'
WHEN salary >= 40000 AND salary < 50000 THEN 'Medium salary'
WHEN salary >= 50000 THEN 'High salary'
END salary_check
FROM employee;

SELECT
last_name,
DECODE(UPPER(last_name),
'JONES','The name is Jones',
'SMITH','The name is Smith',
'KING','The name is king',
'The name is something else') AS namecheck
From employee;

SELECT id,
last_name,
salary,
DECODE(SIGN(40000-salary), 1,'Low salary',-1,
DECODE(SIGN(50000-salary),1,'Medium salary',-1,
'High salary','Unsure'),'Unsure') AS salary_check
FROM employee;

SELECT SUM(salary)
FROM employee;

SELECT SUM(salary)
FROM employee
WHERE last_name <> 'SIMPSON';

SELECT SUM(salary*1.2)
FROM employee;

SELECT SUM(DISTINCT salary)
FROM employee;

SELECT COUNT(*)
FROM employee;

SELECT COUNT(last_name)
FROM employee;

SELECT COUNT(DISTINCT last_name)
FROM employee;

SELECT COUNT(*)
FROM employee
WHERE salary <= 40000;

SELECT AVG(salary)
FROM employee
WHERE office_id = 2;

SELECT MIN(salary)
FROM employee
WHERE office_id = 3;

SELECT MAX(salary)
FROM employee
WHERE office_id IN (1,2);

SELECT office_id, COUNT(*)
FROM employee
GROUP BY office_id;

SELECT o.address, COUNT(*)
FROM employee e
INNER JOIN office o ON e.office_id = o.id
GROUP BY o.address
ORDER BY o.address;

