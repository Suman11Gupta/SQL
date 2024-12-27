create database Trigger1;
use Trigger1;

create table Sports
(
Id int Primary Key,
Spname Varchar(45),
Fees Int,
Gender Char(1),
Studname Varchar(12)
)

insert into Sports values(1,'Cricket',1500,'F','Kiran Joshi'),
(2,'Cricket',1500,'F','Mitali Rao'),
(3,'FootBall',1200,'M','Sameer Jha'),
(4,'FootBall',1200,'F','Sneha Soni');

Select * from Sports;

create table Stud_Audit_Test
(
Id int Identity,
Audit_Action text
);
Go
/* ---------------------------Insert---------------------------------- */

create trigger trInsertstud
On sports
for insert
as
begin
declare @Id int
Select @Id =Id from inserted
insert into Stud_Audit_Test 
values ('New Student with Id = ' + Cast(@Id As Varchar(10)) + ' is added at '+ cast(Getdate() as varchar(22)))
end

insert into Sports values(6,'tennis',2500,'M','Mehul Sharma');
select * from Stud_audit_Test;
go

/* ----------------------------- Delete ---------------------------------- */

Create trigger trDeletestud
on Sports
for Delete 
As
Begin
Declare @Id int
Select @Id = Id from deleted 
Insert into Stud_Audit_Test
values ('An existing employee with Id =' + cast (@Id as varchar(10)) +' is deleted at ' + cast (getdate() as varchar(22)))
end

delete from Sports where id=5;
select * from Stud_Audit_Test;
go

/* --------------------------------------------- Update --------------------------------- */

create Trigger trUpdatestud
On Sports
for Update
as
begin
Declare @Id int
select @Id = Id from inserted 
Insert Into Stud_Audit_Test
values ('An existing employee with id = ' + cast(@Id As varchar(10)) + ' is Updated at ' + cast (Getdate() as varchar(22)))
end

select * from Sports;
update Sports set gender = 'M' where id=4;
select * from Stud_Audit_Test;