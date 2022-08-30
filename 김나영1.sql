ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

UPDATE customer_meeting
SET employee_id =6, meeting_date = DATE '2018-08-22'
WHERE id =2;

SELECT * FROM customer_meeting;

ALTER TABLE employee
ADD job_title VARCHAR2(100);

ALTER TABLE employee
MODIFY job_title NVARCHAR2(250);

DELETE FROM office
WHERE address = '10 Collins Road';

rollback;

DELETE FROM office
WHERE id >=1;

rollback;

ALTER TABLE employee
RENAME COLUMN job_title TO position_title;

ALTER TABLE employee
DROP COLUMN position_title;

SELECT customer_meeting.id,employee_id,company, meeting_date,last_name
FROM customer_meeting
JOIN employee ON customer_meeting.employee_id = employee.id;

SELECT
s.id,
s.employee_id,
s.company,
s.meeting_date,
e.last_name
FROM customer_meeting s
JOIN employee e ON s.employee_id = e.id;

INSERT INTO customer_meeting(id, employee_id, company, meeting_date)
VALUES(3, NULL,'WXC Services',DATE '2018-08-23');

SELECT * FROM customer_meeting;

SELECT
c.id,
c.employee_id,
c.company,
c.meeting_date,
e.last_name
FROM customer_meeting c
INNER JOIN employee e ON c.employee_id = e.id;

SELECT
s.id,
s.employee_id,
s.company,
s.meeting_date,
e.last_name
FROM customer_meeting s
LEFT JOIN employee e ON s.employee_id = e.id;

SELECT
e.id,
e.last_name,
e.salary,
s.id,
s.company,
s.meeting_date
FROM employee e
LEFT JOIN customer_meeting s ON e.id=s.employee_id
ORDER BY e.id;

SELECT
e.id,
e.last_name,
e.salary,
s.id,
s.company,
s.meeting_date
FROM customer_meeting s
RIGHT JOIN employee e ON e.id = s.employee_id;

SELECT
e.id,
e.last_name,
e.salary,
s.id,
s.company,
s.meeting_date
FROM employee e
FULL JOIN customer_meeting s ON e.id = s.employee_id
ORDER BY e.id;








