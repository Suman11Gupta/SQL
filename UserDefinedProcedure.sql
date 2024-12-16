use emp_dept;

----user Defined Procedure
create procedure myProcedure
as begin
select * from dept;
select ename,job,sal,deptno from emp where sal in(select max(sal) from emp group by deptno)
end

exec myProcedure

-----Alter
alter procedure myProcedure(@dno as int)
as 
begin
select * from dept where deptno=@dno;
select ename,job,sal,deptno from emp where sal in(select max(sal) from emp group by deptno) and deptno=@dno;
end

exec myProcedure 10;

------Square
create procedure mysquare(@no as int)
as
begin 
declare @ans as int
set @ans=@no*@no
select 'square of',@no,'is',@ans
end

exec mysquare 34;

-----Create Procedure to display all records where employee name starts with 'A'
create procedure proname
as
begin
select ename from emp where ename like '%a%'
end

exec proname;

-----Create procedure with two input parameter to find the addition and subtraction
create procedure sumnsubn(@num1 as int,@num2 as int)
as
begin
	declare @add as int ,@sub as int
	set @add=@num1+@num2;
	set @sub=@num1-@num2;
	select 'Addition',@num1,@num2,'is',@add
	select 'Subtraction',@num1,@num2,'is',@sub
end

exec sumnsubn 12,6;

----Display all the records from emp table where minimum and maximum salary entered by user
create procedure pmaxminsal(@min as int,@max as int)
as
begin
select * from emp 
select * from emp where sal<=@max and sal>=@min;
end

exec pmaxminsal 800,2000;

----Create procedure to find department wise sum of salary where department number entered by user
create procedure pdept(@dno as int)
as
begin
select * from dept;
select deptno=@dno,sum(sal) from emp;
end

exec pdept 10;