create database SQL_View;
use emp_dept;
select

create view checkView as select * from emp where sal>2500;
select * from checkView;
select * from emp;
insert into checkView (empno,ename,deptno,sal) values(89787,'ram',10,5000);
alter view checkview as select * from emp where sal<2500 with check option;
select * from checkview;

insert into checkview (empno,ename,deptno,sal) values(89447,'sohan',10,1000);
insert into checkview (empno,ename,deptno,sal) values(89445,'sohan',10,3000);
insert into checkview (empno,ename,deptno,sal) values(89788,'sohan888',10,30000);