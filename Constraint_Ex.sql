Create database Constraint_Ex;
use Constraint_Ex;
Create table Person(id int primary key,fname varchar(10),lname varchar(10));
insert into person values(101,'SS','gg');
insert into person values(101,'VS','gg');
select * from person;
alter table person drop constraint PK__Person__3213E83F060EC399 ;
alter table person add Constraint PK_Person_id primary key (id);
alter table person drop constraint PK_Person_id;
alter table person add Constraint PK_id primary key (id);
alter table person drop constraint PK_id;
alter table person add Constraint PK_id1 primary key (id);
alter table person drop constraint PK_id1;

drop table person;
Create table Person(id int primary key,fname varchar(10),lname varchar(10));
insert into person values(101,'SS','gg');
insert into person values(101,'VS','gg');
select * from person;

alter table person drop constraint PK__Person__3213E83F282D03C7 ;
alter table person add Constraint PK_Person_id primary key (id);
alter table person drop constraint PK_Person_id;

Select table_name, Constraint_type,Constraint_name from information_schema.table_constraints
where table_name='person';

DROP TABLE PERSON;

create table person(person_id int,fname varchar(15),lname varchar(15),Constraint pk_person_id primary key(person_id),Constraint un_person_fname unique (fname));
insert into person values(112,'sanjay','gandhi');
select * from person;
alter table person drop Constraint un_person_fname;
alter table person add Constraint un_person_fname Unique (fname);


Create table Courses(Course_id int primary key,Course_name varchar(10),person_id int, Constraint fk_person_id foreign key(person_id) references person(person_id));
insert into courses values (1000,'java',112);
insert into courses values (1001,'python',112);
select * from person;
select * from courses;

alter table person add City varchar(10);
alter table person add constraint chk_person_city check (City in ('pune','mumbai','nagpur'));
update person set City='mumbai';




