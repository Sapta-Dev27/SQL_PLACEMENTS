---- ALTER IS USED TO CHANGE THE SCHEMA ---
 #useed to add a column to a table
 
 ALTER table Employee
 ADD phoneNo INT NOT NULL;
 
 
 SELECT phoneNo from Employee;
 
 #used to delete a column from a table
 ALTER table Employee 
 DROP phoneNo ;
 
 SELECT * from Employee;
 
 # modify is used to change the CONTRAINT of any colum 
 
 ALTER table Employee
 MODIFY dept VARCHAR(20) DEFAULT "Not Assigned" ;
 
 # this will throw an error cause phoneNo field does not exist in the table
 ALTER table Employee
 MODIFY phoneNo int NOT NULL;
 
 ALTER table Employee
 ADD email VARCHAR(100) NOT NULL ;
 
 # this changes the name , dataType of a column to new dataType /columm name / constraints
 ALTER table Employee
 CHANGE email email_employee VARCHAR(100) NOT NULL;
 
 ALTER table Employee
 RENAME COLUMN age  to employee_age;
 
 RENAME TABLE Employee to Employee_details;
 
 SHOW TABLES;
 
TRUNCATE table fees;
select * from fees;

DELETE   from employee_details where empId = 101;
SELECT * from employee_details;

SET SQl_SAFE_UPDATES=0;
DELETE from employee_details where age < 19;

DROP TABLE fees;
SHOW TABLES ;

SHOW TABLES;

DROP TABLE courses;

show databases;
 