------Indexes

create database Employee;

Create table Employees(Id int primary key identity,
Ename nvarchar(50),
Email nvarchar(50),
Department nvarchar(50))

Set Nocount on
/* the message that indicates the number of rows that are affected by the T-Sql statement is not returned as part of the resuls.*/

Declare @counter int=1

while (@counter <=500)
Begin 
Declare @Name nvarchar(50) ='ABC'+RTRIM(@counter)
Declare @Email nvarchar(50) ='abc' +RTRIM(@counter)+ '@aptech.com'
Declare @Dept nvarchar(10) ='Dept' +RTRIM(@counter)

Insert into Employees values (@Name,@Email,@Dept)
set @counter =@counter  +1

If(@counter % 10000 =0)
print RTRIM(@counter)+ 'Row Inserted'
End

select * from Employees where Id=200

select * from Employees where Ename='ABC 200'

create nonclustered index Ix_Employees_Name 
On Employees (Ename)

drop index Ix_Employees_Name on Employees;

------Dummy

create table dummyEmp(Empno int,
fname varchar(20),
lname varchar(30))

insert into dummyEmp values(12,'aaa','aaa');
insert into dummyEmp values(1,'bbb','bbb');
insert into dummyEmp values(13,'ccc','ccc');
insert into dummyEmp values(3,'kkk','kkk');

select * from dummyEmp ;

alter table dummyEmp alter column empno int not null
alter table dummyemp add constraint pk_dummy primary key (empno)

-------FactFinance

create table FactFinance(
    FinanceKey int not null,
	DateKey int not null,
	OrganizationKey int not null,
	DepartmentGroupKey int not null,
	ScenarioKey int not null,
	AccountKey int not null,
	Amount float not null,
	Date datetime null
	)

	create clustered index Ix_FactFinance_FinanceKey_DateKey on FactFinance 
	(financeKey,DateKey)
	Go

	

