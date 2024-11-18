create database Suman;
use Suman;
create table s1(id int primary key,fname varchar(10),lname varchar(15),activity varchar(10));
insert into s1 values(101,'joy','shrama','hockey'),(102,'jessy','mishra','hockey'),(103,'ggg','thgy','cricket');
select * from s1;
update s1 set activity='kho-kho' where id=102;
select * from s1;
delete from s1 where id=101;
select * from s1;
alter table s1 add location varchar(10) default('mumbai');
select * from s1;
insert into s1 (id,fname,lname,activity) values(106,'joy2','shrama','hockey');
select * from s1;
alter table s1 drop column s_id;
select * from s1;
alter table s1 add activity_id varchar(10);
alter table s1 add sub_id int identity(1000,5000) not null;
select * from s1;

alter table s1 add person_id uniqueidentifier default newid() not null,personname varchar(10);
update s1 set personname='vedehi' where id=102;



