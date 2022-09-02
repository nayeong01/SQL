SELECT * FROM departments;

SELECT ename,init,job,msal
FROM employees
WHERE deptno =30;

SELECT ename, init, msal AS salary
FROM employees
WHERE deptno = 30;

SELECT DISTINCT job,deptno
FROM employees;

SELECT grade, upperlimit - lowerlimit
FROM salgrades;

SELECT init||' '||ename name, 12*msal yearsal
FROM employees
WHERE deptno = 10;

SELECT ename,(sysdate-bdate)/365
FROM employees
WHERE empno = 7839;

SELECT ename,msal,comm,12*msal+comm
FROM employees
WHERE empno < 7600; -- null이 포함된 계산엔 결과값이 무조건 null이 나온다 --

SELECT ename,init,msal
FROM employees
WHERE msal >= 3000;

SELECT dname, location
FROM departments
WHERE location <> 'CHICAGO';

SELECT deptno,ename,init,msal
FROM employees
WHERE msal < 1500
ORDER BY deptno, ename;

SELECT ename, 12*msal+comm AS yearsal
FROM employees
WHERE job = 'SALESREP'
ORDER BY yearsal desc;

SELECT evaluation
FROM registrations
WHERE attendee = 7788
ORDER BY evaluation;

SELECT code, category, duration
FROM courses
WHERE category = 'BLD'
OR duration = 2;

SELECT 'is ture ' AS condition
FROM dual
WHERE 1=1 OR 1=0 AND 0=1;

SELECT 'is true ' AS condition
FROM dual
WHERE (1=1 OR 1=0) AND 0=1;

SELECT 'is true ' AS condition
FROM dual
WHERE 1=1 OR (1=0 AND 0=1);

SELECT ename,job,deptno
FROM employees
WHERE deptno <=10;

SELECT ename, job, deptno
FROM employees
WHERE NOT deptno > 10;

SELECT code, category, duration
FROM courses
WHERE (category = 'BLD' OR duration =2)
AND NOT(category ='BLD' AND duration = 2);

SELECT ename,init,msal
FROM employees
WHERE msal between 1300 AND 1600;

SELECT empno,ename,init
FROM employees
WHERE empno IN (7499,7566,7788);

SELECT * FROM registrations
WHERE evaluation NOT IN (3,4,5);

SELECT * FROM courses
WHERE description LIKE '%SQL%';

SELECT empno,init,ename
FROM employees
WHERE ename LIKE '_A%';

SELECT empno, begindate, comments
FROM history
WHERE comments LIKE '%0\%%' ESCAPE '\';

SELECT attendee, begindate,
    CASE evaluation
        WHEN 1 THEN 'bad'
        WHEN 2 THEN 'mediocre'
        WHEN 3 THEN 'ok'
        WHEN 4 THEN 'good'
        WHEN 5 THEN 'excellent'
        ELSE 'not filled in'
    END AS evaluation
FROM registrations
WHERE course = 'SQL';

SELECT ename, job,
    CASE WHEN ename = 'SMITH' THEN '30%'
         WHEN job = 'TRAINER' THEN '10%'
         WHEN job = 'MANAGER' THEN '20%'

         ELSE '0%'
    END AS raise
FROM employees
ORDER BY raise DESC, ename;

SELECT attendee, course
FROM registrations
WHERE course IN ('JAV','PLS','XML');

SELECT attendee, course
FROM registrations
WHERE course IN (SELECT code FROM courses WHERE category ='BLD');

SELECT attendee
FROM registrations
WHERE (course,begindate) IN 
(SELECT course, begindate FROM offerings WHERE location = 'CHICAGO');

SELECT ename, init, bdate
FROM employees
WHERE bdate > (SELECT bdate FROM employees WHERE empno = 7876);

SELECT ename, init, bdate
FROM employees
WHERE bdate > (SELECT bdate FROM employees WHERE empno = 99999);


SELECT ename, init, bdate
FROM employees
WHERE bdate > (SELECT bdate FROM  employees WHERE ename = 'JONES;');

SELECT empno, ename,comm
FROM employees
WHERE comm > 400;

SELECT * FROM registrations
WHERE evaluation NOT IN (1,2,3,NULL);