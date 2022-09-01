--1--
SELECT code,
description,
category,
duration
FROM courses
WHERE duration = 4;

--2--
SELECT empno,ename,init,job,mgr,bdate,msal,comm,deptno
FROM employees
ORDER BY job, bdate DESC;

--3--
SELECT course,
begindate,
trainer,
location
FROM offerings
WHERE location IN('CHICAGO','SEATTLE');

--4--
SELECT r.course,
r.begindate,
r.attendee,
e.ename
FROM registrations r
INNER JOIN 
GROUP BY attendee
HAVING COUNT(r.attendee)>2
WHERE course LIKE '%JAV%' OR course LIKE '%XML%';


--5--


