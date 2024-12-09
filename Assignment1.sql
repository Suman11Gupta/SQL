create database emp_dept
use emp_dept;

DROP TABLE IF EXISTS emp;

CREATE TABLE emp1 (
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

INSERT INTO emp1 VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp1 VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp1 VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp1 VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp1 VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp1 VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp1 VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp1 VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp1 VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp1 VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp1 VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp1 VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp1 VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp1 VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

select * from emp1;
select * from dept;

/* 1.	Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with the Employee Number appearing first. */
select empno,ename,job,hiredate from emp1;

/* 2.	Query to display unique deptno from the Employee Table. */
select distinct deptno from emp1;

/* 3.	Query to display the Employee Name concatenated by a Job separated by a comma. */
select ename,+ ','as n,+job from emp1;

/* 4.	Query to display the Employee Name and Salary of all the employees earning more than $2850. */
select ename,sal from emp1 where sal > 2850 ;

/* 5.	Query to display Employee Name and Department Number for Employee No= 7844. */
select ename,deptno  from emp1 where empno=7844;

/* 6.	Query to display Employee Name and Salary for all employees whose salary is not in the range of $1500 and $2850. */
select ename,sal from emp1 where sal not between 1500 and 2850 ; 

/* 7.	Query to display Employee Name and Department No. of all the employees in Dept 10 and Dept 30 in alphabetical order by name. */
select ename,deptno from emp1 where deptno in (10,30) order by ename; 

/* 8.	Query to display the Name and Hire Date of every Employee who was hired in 1981. */
select ename,hiredate from emp1 where year (hiredate)=1981;
select * from emp1;
select * from dept;

/* 9.	Query to display the Name and Job of all employees who have not assigned a manager. */
select ename,job from emp1 where job!='manager';

/* 10.	Query to display the Name, Salary, and Commission for all the employees who earn a commission.*/
select ename,sal,comm from emp1 where comm!=null or comm>0;

/* 11.	Query to display records where employes commission is greater than salary */
select comm from emp1 where comm>sal;

/* 12.	Query to display the Name of all the employees where the third letter of their name is ‘A’. */
select ename from emp1 where ename like '__a%';

/* 13.	Query to display the Name of all employees either have ‘R’s  in their name and are either in Dept No = 30 or their Manger’s Employee No = 7788. */
select ename,deptno,mgr from emp1 where ename like '%r%' and (deptno=30 or mgr=7788);

/* 14.	Query to display Name, Salary, and Commission for all employees whose Commission amount is greater than their Salary increased by 5%. */
select ename,sal,comm from emp1 where comm>sal+(sal*5/100);

/* 15.	Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary. */
select ename as EName ,sal as Salary ,sal*3 as Dreamsalary  from emp1 ; 

/* 16.	Query to display Name, Hire Date, and Day of the week on which the employee started. */
select ename,hiredate,day(hiredate) as day1 from emp1;

/* 17.	Query to display Unique Listing of all Jobs that are in Department number 30. */
select distinct deptno,job from emp1 where deptno=30;

/* 18.	Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location. */
select * from emp1;
select * from dept;
select e.ename,e.job,d.deptno,d.dname,d.loc from emp1 e join dept d on e.deptno=d.deptno where loc='dallas';

/* 19.	Query to display the number of employees performing the same Job type functions. */
select distinct job ,count(job) as performing from emp1 group by job;

/* 20.	Query to display the names and salaries of all employees who report to a supervisor named ‘King’ 
21.  Dispaly all the employee where name either start with A or starts with K.
22. Display all the employees where 2nd character of name is U and fourth character is N.
23 Display all the employees where name starts from alphabet S to Z
*/
