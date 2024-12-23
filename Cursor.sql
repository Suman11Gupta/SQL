Use emp_dept;
select * from emp;
select * from dept;
Declare @emp_id int,@emp_name varchar(20),
@sal int;
Print '----------Employee Details---------';

Declare emp_cursor1 Cursor for 
select empno,ename,sal
from emp
order by empno;

Open emp_cursor1

Fetch Next From emp_cursor1
Into  @emp_id,@emp_name,@sal

Print 'Employee_Id Employee_name Salary'

While @@Fetch_Status=0
Begin
	if @sal>=10000
		print ' ' +Cast(@emp_id as varchar(10))+'             '+
			cast(@emp_name as varchar(20))+' '+cast(@sal as varchar(10))+'      '+
		    'Grade A'
    else
       Print '  '+cast(@emp_id as varchar(10))+'        '+
           cast(@emp_name as varchar(20))+'    '+cast(@sal as varchar(10))
      fetch Next from emp_cursor1
into @emp_id,@emp_name,@sal

end
close emp_cursor1;
deallocate emp_cursor1;

/* create cursor to display  employee name from employee table if employee name starts with s the name should concatenate
with have a nice day and for all other names display the message WELCOME */

declare @ename varchar(10);
Print '------Concatenate---------'
declare name_cursor1 cursor for
select ename from emp;

open name_cursor1

fetch next from name_cursor1
into @ename

print 'Name      Message'

While @@Fetch_status=0
Begin
if @ename like 's%'
     print @ename+' Have a nice day!!!!! '
else
print @ename+' Welcome!!!!'
fetch next from name_cursor1
into @ename

end
close name_cursor1;
deallocate name_cursor1;
