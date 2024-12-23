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

