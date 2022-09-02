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

--4-- 수정필요
SELECT DISTINCT r.attendee,
r.course,
e.ename
FROM registrations r
INNER JOIN employees e ON r.attendee = e.empno
WHERE course||attendee LIKE 'JAV%'
OR course||attendee LIKE 'XML';
--정답--
SELECT attendee
FROM registrations
WHERE course = 'JAV'
AND attendee IN(SELECT attendee FROM registrations WHERE course = 'XML');

--5--
SELECT ename,
init
FROM employees
WHERE ename||init <> 'JONESR';

SELECT ename, init
FROM employees
WHERE NOT (ename = 'JONES' AND init = 'R');

--6--
SELECT ename,
empno,
BDATE,
job
FROM employees
WHERE (sysdate-bdate)/365 > 62
AND job IN ('TRAINER', 'SALESREP');

SELECT empno, job, bdate
FROM employees
WHERE job IN('TRAINER','SALESREP')
AND bdate < '1960-01-01';

--7--
SELECT *
FROM employees
WHERE deptno <> 20;

--8--
SELECT DISTINCT r.attendee,
e.ename
FROM registrations r
INNER JOIN employees e ON r.attendee = e.empno
WHERE NOT course||ename LIKE 'JAV%';

SELECT * FROM employees
WHERE empno NOT IN (SELECT attendee FROM registrations WHERE course = 'JAV');

--9--
SELECT empno, ename,init FROM employees
WHERE empno IN (SELECT mgr FROM employees);

SELECT empno, ename, init FROM employees
WHERE empno NOT IN (SELECT mgr FROM employees WHERE mgr IS NOT NULL);

--10--
SELECT *
FROM offerings
WHERE begindate between '1999-01-01' AND '1999-12-31'
AND course IN(SELECT code FROM courses WHERE category = 'GEN');

--11--

SELECT * 
FROM offerings
WHERE trainer IN (SELECT empno FROM employees WHERE ename = 'SMITH' AND init = 'N');

SELECT attendee
FROM registrations
WHERE course IN (SELECT course FROM offerings
                        WHERE trainer IN (SELECT empno
                                          FROM employees
                                          WHERE ename = 'SMITH' AND init = 'N'));
                                          
SELECT ename, init
FROM employees
WHERE empno IN (SELECT attendee FROM registrations
WHERE course IN (SELECT course FROM offerings
WHERE trainer IN (SELECT empno FROM employees
WHERE ename = 'SMITH' AND init = 'N')));

--12--

--13--
