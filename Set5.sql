CREATE TABLE ProjectDetails_table (
    ProjectDetailID Serial,
    EmployeeDetailID INT,
    ProjectName VARCHAR(255)
);

INSERT INTO ProjectDetails_table (EmployeeDetailID, ProjectName) VALUES
(1, 'Image Classification'),
(1, 'Analytics'),
(1, 'Text Prediction'),
(2, 'Platform design'),
(3, 'Data Visualization'),
(3, 'Data extracting'),
(3, 'Model Testing'),
(4, 'System checking'),
(6, 'Synthetic data');


select * from projectdetails_table


--Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. 

select department, sum(salary) as Totalsalary from emp_table group by department

--Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary. 

select department, sum(salary) as Totalsalary from emp_table group by department order by Totalsalary

--Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary. 

select department, sum(salary) as Totalsalary from emp_table group by department order by Totalsalary desc

--Write the query to get the department, total no. of departments, total(sum) salary 
--with respect to department from "EmployeeDetail" table. 

select department, count(*) as Totaldepartments,sum(salary) as totalsalary 
								from emp_table group by department
--. Get department wise average salary from "EmployeeDetail" table order by salary 
ascending 

select department, avg(salary) as AverageSalary from emp_table group by department order by AverageSalary


--Get department wise minimum salary from "EmployeeDetail" table order by salary ascending

select department, min(salary) as Minsalary from emp_table group by department order by Minsalary

INSERT INTO ProjectDetails_table (EmployeeDetailID, ProjectName) VALUES
(3, 'Image Classification')
--Write down the query to fetch Project name assign to more than one Employee 

select projectname,count(*) as Numberofemp from projectdetails_table group by projectname having count(*) > 1


