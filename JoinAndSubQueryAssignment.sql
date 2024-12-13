create database emp_dept
use emp_dept;

DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  empno int primary key,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno int not null,
  foreign key (deptno) references dept(deptno)
); 	

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno int primary key,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);

INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
INSERT INTO dept VALUES ('30','SALES','CHICAGO');
INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');

INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

select * from emp;
select * from dept;

/* 1.  	Display department wise average salary. */
select distinct deptno,avg(sal) as average  from emp group by deptno;

/* 2.  	Display department wise and job wise average salary. */
select  deptno,job,avg(sal) as average from emp group by deptno,job;

/* 3.  	Display department wise minimum salary , maximum salary and sum of salary.*/
select deptno,max(sal) as maximum,min(sal) as minimum,sum(sal) as sum from emp group by deptno;

/* 4.  	Display all the employees in each job where salary is greater than 3000.*/
select job,ename,sal from emp where sal>3000 group by job,ename,sal;

/* 5.  	Display minimum join date and maximum join date. */
select min(hiredate) as Minimum,max(hiredate) as maximum from emp;

/* 6.  	Display the department having more than 2 salesman.*/
select deptno from emp
/* 7.  	Display all ename ,salary, deptno for each job where salary is greater than 3000
8.  	Display deptno, location and department name wise total salary and commission.
9.  	List the department with employee name and also where the employees not working.
10.   Display the record where employees hire date is greater than his managers hiredate
11.   Display the employee whose sal is greater than max sal in dept 30.
12.   Display the employees whose salary = the max average salary of each job */
