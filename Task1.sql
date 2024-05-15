Create table emp_table(eid int, FirstName varchar(20),
	LastName varchar(20),Salary int,JoiningDate varchar(30),Department varchar(20), Gender varchar(10))


insert into emp_table values(1, 'Anbu', 'Arivu',60000,'2013-02-15 11:16:28:290','Data Science','male'),
(2, 'Surya', 'Jai',75000,'2012-02-15 12:16:58:290','Designer','female'),
(3, 'anish', 'kumar',85000,'2014-02-15 14:16:58:793','Data Science','female'),
(4, 'ananya', 'pandey',90000,'2014-02-15 13:16:58:290','Admin','male'),
(5, 'anil', 'gupta',30000,'2014-02-15 12:16:58:793','Marketing','male')


-- 1. Reterive all data from emp_table
select * from emp_table

--2. Write a query to get only "FirstName" column from "EmployeeDetail" table 
select FirstName from emp_table
--3. . Write a query to get FirstName in upper case as "First Name".  
select UPPER (firstname)as f_name from emp_table
--4.. Write a query to get FirstName in lower case as "First Name".  
select lower(firstname) as l_name from emp_table
--5. Write a query for combine FirstName and LastName and display it as "Name" (also 
--include white space between first name & last name) 
select firstname||'_'||lastname as name from emp_table
select concat(firstname,'',lastname) as name from emp_table

--6.  Select employee detail whose name is "Anbu" 
select * from emp_table where firstname ='Anbu'

--7.Get all employee detail from EmployeeDetail table
--whose "FirstName" start with letter 'a'. 
select * from emp_table where firstname like 'a%'
--case insenstive use ilike (Startswith A or a  )
select * from emp_table where firstname ilike 'A%'

--8.Get all employee details from EmployeeDetail table whose "FirstName" contains 
'i'  
select * from emp_table where firstname like '%i%'

--9.  Get all employee details from EmployeeDetail table whose "FirstName" end with 
'h'  
select * from emp_table where firstname like '%h'

--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with 
--any single character between 'a-p' 

select * from emp_table where firstname ~ '^[Aa-nN]'

--11 Get all employee detail from EmployeeDetail table whose "FirstName" not start 
--with any single character between 'a-p' 
select * from emp_table where firstname ~'^[^a-n]'

--12.Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' 
--and contain 4 letters. The Underscore(_) Wildcard Character represents any single character. 

select * from emp_table where gender like '__le'

--13.Get all employee detail from EmployeeDetail table whose "LastName" start with 
--'A' and contain 5 letters. 

select * from emp_table where lastname like'A____'

--14.  Get all employee detail from EmployeeDetail table whose "FirstName" 
--containing '%'. ex:-"Vik%as". 

select * from emp_table where firstname like'%[%]%'

--15.Get all unique "Department" from EmployeeDetail table. 

select distinct(Department) from emp_table

--16.Get the highest "Salary" from EmployeeDetail table. 
select max(Salary) as MaximumSalary from emp_table

--17. Get the lowest "Salary" from EmployeeDetail table. 

select min(salary) from emp_table
	
---SQL SERVER DATE RELATED INTERVIEW QUERY--
--18. Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013" 


--19.Show only time part of the "JoiningDate".

select convert(varchar(20),JoiningDate,108)from emp_table

--20. Get only Year part of "JoiningDate". 

select Extract (YEAR from JoiningDate) from emp_table

--21. Get only Month part of "JoiningDate". 

select Extract (Month from JoiningDate) from emp_table


ALTER TABLE emp


--22. Get system date. 

select Current_Date

--23.Get all employee details from EmployeeDetail table whose joining year is 2013.

select * from emp_table where extract(year from JoiningDate)='2013'

--24.Get all employee details from EmployeeDetail table whose joining month is Jan(1). 
select * from emp_table where extract(month from joiningdate)='02'

--25.Get all employee details from EmployeeDetail table whose joining date between 
"2013-01-01" and "2013-12-01". 
select * from emp_table where joiningdate between '2013-01-01' and '2013-12-01'

--26. Get how many employee exist in "EmployeeDetail" table.
select count(*) from emp_table

--27.  Select only one/top 1 record from "EmployeeDetail" table.
select * from emp_table limit(3)

--28. Select all employee detail with First name "Anbu","Anil", and "Surya". 
select * from emp_table where firstname in('Anbu','Surya','anil')

--29. Select all employee detail with First name exclude "Anbu","Anil", and "Surya".
select * from emp_table where firstname not in('Anbu','Surya','anil')

--30.. Select first name from "EmployeeDetail" table after removing white spaces from right side 
select RTRIM (firstname) as Fname from emp_table

--31.. Select first name from "EmployeeDetail" table after removing white spaces from left side 
select ltrim (firstname) as Fname from emp_table

--32.Display first name and Gender as M/F.(if male then M, if Female then F) 

select firstname, CASE when gender = 'male' then 'M' 
					when gender = 'female' then 'F' 
					end as gender from emp_table

--33. Select first name from "EmployeeDetail" table prifixed with "Mr/Ms " 

select  'Mr/Ms' ||'.'|| firstname from emp_table

--34. Get employee details from "EmployeeDetail" table whose Salary greater than  60000
	

select * from emp_table where Salary > 60000

--35.  Get employee details from "EmployeeDetail" table whose Salary less than 70000
select * from emp_table where salary < 70000

--36.  Get employee details from "EmployeeDetail" table whose Salary between 50000 and 60000
select * from emp_table where salary between 50000 and 60000

--37.Select second highest salary from "EmployeeDetail" table. 

select firstname, salary from emp_table where salary in (select salary from emp_table order by salary desc limit(2))order by salary limit(1)

