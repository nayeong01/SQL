ALTER TABLE employee
ADD office_id NUMBER(5);

SELECT id, last_name, salary, office_id FROM employee;

UPDATE employee SET office_id = 1 WHERE id IN (1,4,6,9);
UPDATE employee SET office_id = 2 WHERE id IN (2,3);
UPDATE employee SET office_id = 3 WHERE id IN (7,8);

SELECT id,
e.last_name,
e.salary,
o.address
FROM employee e
INNER JOIN office o USING (id);

SELECT e.id,
e.last_name,
e.salary,
e.office_id,
o.address
FROM employee e
INNER JOIN office o ON e.office_id = o.id;

SELECT id,
e.last_name,
e.salary,
e.office_id,
o.address
FROM employee e
NATURAL JOIN office o;

SELECT e.id,
e.last_name,
e.salary,
e.office_id,
o.address
FROM employee e, office o;

SELECT e.id,
e.last_name,
e.salary,
e.office_id,
o.address
FROM employee e, office o
WHERE e.office_id = o.id(+);

SELECT e.id,
e.last_name,
e.salary,
e.office_id,
o.address
FROM employee e, office o
WHERE e.office_id(+) = o.id;

SELECT e.id,
e.last_name,
o.address,
s.company,
s.meeting_date
FROM employee e
LEFT JOIN office o ON e.office_id = o.id
LEFT JOIN customer_meeting s ON e.id = s.employee_id;

SELECT
s.id AS sales_meeting_id,
s.company,
s.meeting_date,
e.id AS employee_id,
e.last_name,
o.address
FROM customer_meeting s
LEFT JOIN employee e ON e.id = s.employee_id
LEFT JOIN office o ON e.office_id = o.id;

SELECT e.id,
e.last_name,
o.address,
s.company,
s.meeting_date
FROM employee e
INNER JOIN office o ON e.office_id = o.id
LEFT JOIN customer_meeting s ON e.id = s.employee_id;

ALTER TABLE employee
ADD department_id NUMBER(5);

CREATE TABLE department (
id NUMBER(5),
department_name VARCHAR2(200)
);

ALTER TABLE employee
ADD job_title VARCHAR2(200);

ALTER TABLE employee
DROP COLUMN office;

rollback;


