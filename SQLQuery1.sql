
use suman12;
create table student(id int primary key,Fname varchar(10),Lname varchar(10),Bdate date,Cource varchar(10));
insert into student values(11,'suman','gupta','11-02-2002','IT');
insert into student values(12,'sonali','dubey','11-02-2002','IT');
insert into student values(13,'ashish','shukla','11-02-2002','IT');
insert into student values(14,'vineet','gupta','11-02-2002','IT');
insert into student values(15,'shubham','mishra','11-02-2002','IT');

create type s1 from varchar(15) not null;

drop table student;
create table sample(id int primary key, name s1,sub varchar(10));
insert into sample values(101,'suman','a1');
insert into sample (id,name)values(102,'suman');

select TABLE_NAME,column_name,data_type,character_maximum_length from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='sample';

create table student(id int primary key,Fname varchar(10),Lname varchar(10),Bdate date,Cource varchar(10));
insert into student values(11,'suman','gupta','11-02-2002','IT');
insert into student values(12,'sonali','dubey','11-02-2002','IT');
insert into student values(13,'ashish','shukla','11-02-2002','IT');
insert into student values(14,'vineet','gupta','11-02-2002','IT');
insert into student values(15,'shubham','mishra','11-02-2002','IT');

select * into sv from student;
select * from sv;

select * into sv1 from student where 1=2;
select * from sv1;

select Fname,Bdate,Lname into sv3 from student;
select * from sv3;

exec sp_columns sv;

alter table sv alter column Fname varchar(20) not null;
insert into sv values(15,'SSSS','gupta','IT','11-02-2002'); 
insert into sv values(16,'','gupta','IT','11-02-2002'); 

select * from sv;

alter table sv drop column Bdate;
select * from sv;

alter table sv add join_date date;
select * from sv;
