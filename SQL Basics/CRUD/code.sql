use college ;

CREATE table if not exists Employee ( empID INT PRIMARY KEY , age INT NOT NULL CHECK(age > 18 ) , name VARCHAR(100) NOT NULL , dept 
VARCHAR(50) NOT NULL , salary INT NOT NULL , joiningDate DATE default "2026-01-01" );

CREATE table if not exists project ( pid INT PRIMARY KEY , name VARCHAR(100) , employeeID INT , foreign key(employeeID) references Employee
(empID) ON UPDATE CASCADE ON DELETE CASCADE) ;

INSERT into Employee (empID , age , name , dept , salary ) VALUES ( 100 , 19 , 'Sapta' , 'IT' , 50000) , ( 101 , 20 , 'Anuska' , 'IT' , 51000),
( 102 , 19 , 'Anu' , 'IT' , 50000) , ( 104 , 23 , 'Satya' , 'IT' , 40000) , ( 105 , 22 , 'Ranit' , 'IT' , 52000);

INSERT into project (pid , name , employeeID) VALUES ( 1000, 'US-CLIENT' , 101) , ( 1001, 'US-CLIENT' , 102) , ( 1002, 'US-CLIENT' , 101) ,
( 1003, 'US-CLIENT' , 102) , ( 1004, 'US-CLIENT' , 105) ;

UPDATE  Employee SET salary=55000 where dept='IT';
SET SQL_SAFE_UPDATES=0;

SET SQL_SAFE_UPDATED=0;
update Employee SET name="Saptarshi" where name="Sapta";

SET SQL_SAFE_UPDATES=0;
update Employee SET name="Anuska Babby" where name="Anu";

INSERT into Employee (empID , age , name , dept , salary ) VALUES ( 1002 , 19 , 'Sapta-2' , 'HR' , 50000) ,
 ( 1011 , 20 , 'Anuska-2' , 'HR' , 51000);
 
 SELECT * from Employee;
 
 Delete FROM Employee where dept = "HR";
 DELETE FROM Employee where name = "Anuska";
 DELETE FROM project where pid = 1000;
 
 SELECT * from Employee;
 SELECT * from project;
 
 SELECT  pid from project;
 SELECT empID ,  age , name from Employee;
 SELECT * from Employee where age < 21;
 
 SELECT * from Employee where (salary > 50000 AND salary <= 55000);
 
 
 
 
 