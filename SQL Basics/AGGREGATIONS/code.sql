------ CLAUSES IN SQL ----- 

---- 1. WHERE CLAUSE  : used for retreiving certaining some specific data -----
use college;
Select * from employee_details where age > 20;


---- 2. LIMIT CLAUSE : used for limiting certain no of rows ----

Select * from employee_details where age > 20  LIMIT  1 ;


---- 3. ORDER BY CLAUSE : used for sorting results : asc / desc .DEFAULT : asc -----

Select * from employee_details ORDER BY age ASC ;

SELECT * from employee_details Order by age DESC ;


SELECT * from employee_details where empId = 104 ;

SELECT * from employee_details where empID = 104 AND age > 20 ;

SELECT * from employee_details where age NOT IN ( 20 , 21 , 22 , 23 );


SELECT * from employee_details ORDER BY age DESC LIMIT 3 ;

SELECT * from employee_details ORDER BY age ASC LIMIT 2 ;



---- GROUP BY and HAVING clauses ----

use college ;
SELECT * from employee_details ;

SELECT dept , avg(salary) from employee_details GROUP by dept ;

SELECT dept , AVG(salary) as avgsalary from employee_details GROUP by dept ;
SELECT dept , avg(salary) as avgsalary from employee_details GROUP by dept having avgsalary > 50000;

--- AGGREGATE FUNCTIONS ----

SELECT dept , COUNT(dept) as total_count from employee_details GROUP by dept ;

SELECT dept , AVG(salary) as avg_salary from employee_details GROUP by dept ;
SELECT dept , AVG(age) as avg_age from employee_details GROUP by dept having avg_age > 18;

SELECT dept , MAX(age) as max_age from employee_details GROUP by dept ;
SELECT dept , min(age) as min_age from employee_details GROUP by dept ;

SELECT dept , MAX(salary) as max_salary from employee_details GROUP by dept;
SELECT dept , MIN(salary) as min_salary from employee_details GROUP by dept ;

SELECT dept , sum(salary) as avg_salary , count(empID) as total_employees , AVG(age) as avg_age from employee_details Group by dept ;



use collge ;
SELECT dept , COUNT(empID) as total_count from employee_details GROUP BY dept;

SELECT dept , MAX(salary) as max_salary from employee_details GROUP by dept ORDER BY max_salary DESC ;

SELECT dept , MIN(salary) as min_salary from employee_details GROUP BY dept having min_salary > 10000 ORDER BY min_salary DESC ;


SELECT dept , COUNT(empID) as total_count from employee_details GROUP BY dept ORDER BY total_count DESC;


SELECT dept , AVG(salary) as avg_salary from employee_details GROUP by dept having avg_salary > 20000;


----------- DIFF BTW : having and where clause ------

---- HAVING CLAUSE IS APPLIED WHEN U PERFORM OPS ON A AGGREGATED DATA  whereas WHERE clause is used when we perform OPS on A NON AGGREGATED DATA---

----- GENERAL ORDER OF SQL : SELECT , FROM , WHERE , GROUP BY , HAVING , ORDER BY , LIMIT ---
