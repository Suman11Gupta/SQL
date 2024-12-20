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

---Output

----Total salary 
create procedure totalsal(@deptno int,@total int output)
as
begin
select @total=sum(sal) from emp group by (deptno) having deptno=@deptno
end

declare @T int;
exec totalsal 20,@T output
select @T

----create procedure to find minimum and maximum salary of each department

create procedure MinMax(@deptno as int,@min int Output,@max int Output)
as
begin
select @min=min(sal),@max=max(sal) from emp where deptno=@deptno
end

declare @min int
declare @max int
exec MinMax 10,@min output,@max output
select @min,@max

----Enter two number as input and display addition as output
create procedure Addition(@num1 as int,@num2 as int,@add int output)
as
begin
set @add=@num1+@num2
end

declare @addition int
exec Addition 34,14 ,@addition output
select @addition

--If Else

----Eligible for vote or not

create procedure ElGPro(@age int,@result varchar(30) output)
as
begin
	IF(@age>=18)
		select @result='Eligible for voting'
	ELSE
		select @result='Not eligible for vote'
end

declare @res varchar(30)
exec ELGPro 11,@res output
select @res

---Insert record in Employee table

create procedure InsRec(@deptno int)
as
begin
	declare @C int;
	select @C=count(*) from emp where deptno=@deptno;
	If(@C<5)
		insert into emp(empno,deptno,ename) values(20052002,@deptno,'Vineet')
	Else
	select 'count not less than 5'
end

exec InsRec 10

select * from emp;

/* Create procedure calculate commision it will take department number as input parameter if department number is 10 then update all the
 commision with 2000 if department number is 20 update all the Commision with 3000 and for the other department commision is 5% of salary. */

---While loop

 create procedure loopshow(@start int,@end int)
 as
 declare @c int=@start
 while @c<=@end
 begin
	print @c
	set @c=@c+1
 end

 exec loopshow 120,125

----Enter n number display its table

alter procedure table1(@num int)
as 
begin 
	declare @c int=1
	while(@c <= 10)
		begin 
			print Cast (@num as varchar(10))+'X'+Cast(@c as varchar(10))+'='+Cast((@num*@c) as varchar(10))
			set @c=@c+1
		end
end

 exec table1 2;

 ----bikeshop 

 use emp_dept

 create table bikeshop
 (
 id int Primary Key Identity,
 bike_name varchar(50) Not null,
 price float
 )

 declare @count int;
 set @count=1;
 while @count<=10
 begin
 Insert into bikeshop values('Bike'+Cast(@count as varchar),@count*5000)
 set @count=@count+1;
 end;

 select * from bikeshop;
