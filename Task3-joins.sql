select * from emp_table

select * from projectdetails_table
--1. Get employee name, project name order by firstname from "EmployeeDetail" and 
--"ProjectDetail" for those employee which have assigned project already. 


select emp_table.firstname, projectdetails_table.projectname 
	from emp_table inner join projectdetails_table on emp_table.eid = 
	projectdetails_table.employeedetailid order by emp_table.firstname

-- 2.Get employee name, project name order by firstname from "EmployeeDetail" and 
--"ProjectDetail" for all employee even they have not assigned project.

select emp_table.firstname, projectdetails_table.projectname from emp_table 
left outer join projectdetails_table on emp_table.eid = projectdetails_table.employeedetailid
order by emp_table.firstname

--3. Get all project name even they have not matching any employeeid, in left table, 
--order by firstname from "EmployeeDetail" and "ProjectDetail". 
	
select emp_table.firstname, projectdetails_table.projectname from emp_table 
right outer join projectdetails_table on emp_table.eid = projectdetails_table.employeedetailid
order by emp_table.firstname

--4. Get complete record (employeename, project name) from both tables 
--([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL. 

select emp_table.firstname, projectdetails_table.projectname from emp_table 
full outer join projectdetails_table on emp_table.eid = projectdetails_table.employeedetailid
order by emp_table.firstname

--5. Get employee name, project name order by firstname from 
--"EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then 
--display "-No Project Assigned"


select emp_table.firstname, coalesce (projectdetails_table.projectname,'Not assigned') from emp_table Left outer join
projectdetails_table on emp_table.eid = projectdetails_table.employeedetailid order by emp_table.firstname


--6. Write a query to find out the employeename who has not assigned any project, 
--and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]). 

select firstname, coalesce(projectname, 'Not Assigned') from emp_table A left outer join projectdetails_table B
										on A.eid = B.employeedetailid where projectname ISNULL


--7. Write a query to find out the project name which is not assigned to any employee( 
--tables :- [EmployeeDetail],[ProjectDetail]). 

select projectname from emp_table A right outer join projectdetails_table B on A.eid = B.employeedetailid where
firstname ISNULL

--8. Write down the query to fetch EmployeeName & Project who has assign more 
--than one project.

select firstname,eid, projectname from emp_table A inner join projectdetails_table B on 
					A.eid = B.employeedetailid where eid in(
								select employeedetailid from projectdetails_table group by employeedetailid 
								having count(*) > 1  )


--9. Write down the query to fetch ProjectName on which more than one employee 
--are working along with EmployeeName. 

select firstname, eid, projectname from emp_table A inner join projectdetails_table B on
											A.eid = B.employeedetailid where projectname
									in(select projectname from projectdetails_table group by projectname having count(*) > 1)
					